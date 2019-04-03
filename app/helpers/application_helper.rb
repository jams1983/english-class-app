module ApplicationHelper

  def members_of(group)
    members = group.students.map{|student| student.full_name}
    members.to_sentence
  end

  def minutes_to_hours(minutes)
    minutes / 60.to_f
  end

  def map_flash_class(key)
    case key
    when "error", "alert"
      "danger"
    when "notice"
      "success"
    else
      key
    end
  end

  def student_invoice(attendee, lesson)
    StudentInvoice.new(attendee.student, lesson.date.beginning_of_day, lesson.date.end_of_day, lesson.group)
  end
end
