class GroupInvoice

  attr_accessor :start_date, :end_date, :group

  def initialize(group, start_date, end_date)
    self.group = group
    self.start_date = start_date
    self.end_date = end_date
  end

  def total
    @total ||= student_invoices.inject(0) do |total, invoice|
      total += invoice.total
    end
  end

  def duration
    @duration ||= group.lessons.inject(0) do |duration, lesson|
      duration += lesson.duration
    end
  end

  def student_invoices
    @student_invoices ||= group.students.inject([]) do |invoices, student|
      invoices << StudentInvoice.new(student, start_date, end_date)
    end
  end

end
