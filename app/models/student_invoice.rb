class StudentInvoice

  attr_accessor :start_date, :end_date, :student, :total, :hours, :group, :student_total, :koombea_total

  def initialize(student, start_date, end_date, group)
    self.student = student
    self.start_date = start_date
    self.end_date = end_date
    self.group = group
  end

  def student_total
    @student_total ||= total * student_perc
  end

  def koombea_total
    @koombea_total ||= total * koombea_perc
  end

  def total
    @total ||= attendees.inject(0) do |total, attendee|
      price_detail = lesson_price_detail(attendee.lesson)
      total += ((attendee.lesson.duration / 60.to_f) * price_detail.price_per_person) if is_attendance_billable?(attendee)
      total
    end
  end

  def duration
    @duration ||= attendees.inject(0) do |duration, attendee|
      duration += attendee.lesson.duration if is_attendance_billable?(attendee)
      duration
    end
  end

  private

  def billable_attendees(lesson)
    lesson.attendees.inject([]) do |billables, attendee|
      billables << attendee if is_attendance_billable?(attendee)
      billables
    end
  end

  def lesson_price_detail(lesson)
    lesson.group.teacher.price_details.find_by(students_amount: billable_attendees(lesson).size)
  end

  def students
    @students ||= group.students
  end

  def is_attendance_billable?(attendee)
    attendee.attendance_option.bill?
  end

  def attendees
    @attendees ||= Attendee.joins(:lesson).includes(:lesson, :attendance_option).where(student_id: student.id, lessons: {date: (start_date..end_date), group: group})
  end

  def july_2018
    "2018-07-01".to_date
  end

  def student_perc
    @student_perc ||= start_date < july_2018 ? 0.5 : 0.75
  end

  def koombea_perc
    @koombea_perc ||= start_date < july_2018 ? student_perc : 0.25
  end

end
