class Invoice

  attr_accessor :start_date, :end_date, :group, :student_total, :koombea_total

  def initialize(group, start_date, end_date)
    self.group = group
    self.start_date = start_date
    self.end_date = end_date
  end

  def total
    @total ||= totals[:total]
  end

  def student_total
    @student_total ||= totals[:student_total]
  end

  def koombea_total
    @koombea_total ||= totals[:koombea_total]
  end


  def totals
    @totals ||= student_invoices.inject({}) do |acc, inv|
      [:total, :student_total, :koombea_total].each do |key|
        acc[key] ||= 0
        acc[key] += inv.send(key)
      end
      acc
    end
  end

  def duration
    @duration ||= group_lessons.inject(0) do |duration, lesson|
      duration += lesson.duration
    end
  end

  def student_invoices
    @student_invoices ||= students.inject([]) do |invoices, student|
      invoices << StudentInvoice.new(student, start_date, end_date, group)
    end
  end

  def lessons_with_note
    @lessons_note ||= group_lessons.inject([]) do |acc, lesson|
      unless lesson.note.blank?
        acc << lesson
      end
      acc
    end
  end

  private

  def students
    @students ||= group_lessons.inject([]) do |students, lesson|
      lesson.attendees.each do |attendee|
        students << attendee.student unless students.include?(attendee.student)
      end
      students
    end
  end

  def group_lessons
    @group_lessons ||= group.lessons.includes(:attendees).where(date: (start_date..end_date))
  end



end
