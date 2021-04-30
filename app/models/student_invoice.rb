class StudentInvoice

  attr_accessor :start_date, :end_date, :student, :total, :hours, :group, :student_total, :koombea_total

  def initialize(student, start_date, end_date, group)
    self.student = student
    self.start_date = start_date
    self.end_date = end_date
    self.group = group
  end

  def student_total
    @student_total ||= totals[:student]
  end

  def koombea_total
    @koombea_total ||= totals[:koombea]
  end

  def total
    @total ||= student_total + koombea_total
  end

  def duration
    @duration ||= attendees.inject(0) do |duration, attendee|
      duration += attendee.lesson.duration if attendee.attendance_option.bill?
      duration
    end
  end

  private

  def totals
    @totals ||= attendees.inject({ koombea: 0, student: 0 }) do |acc, attendee|
      price_detail = lesson_price_detail(attendee.lesson)
      price_per_person = (attendee.lesson.duration / 60.to_f) * price_detail.price_per_person
      if attendee.attendance_option.bill?
        acc[:koombea] += price_per_person * attendee.koombea_perc
        acc[:student] += price_per_person * attendee.student_perc
      end
      acc
    end
  end

  def lesson_price_detail(lesson)
    students_amount = lesson.billable_attendees_amount
    price_details = lesson.group.teacher.price_details
    price_details.where('price_from <= ? AND students_amount = ?', lesson.date, students_amount)
                 .order(price_from: :desc)
                 .take
  end

  def students
    @students ||= group.students
  end

  def attendees
    @attendees ||= Attendee.joins(:lesson)
                            .includes(:lesson, :attendance_option)
                            .where(student_id: student.id, lessons: {date: (start_date..end_date), group: group})
  end
end
