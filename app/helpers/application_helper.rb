module ApplicationHelper

  def members_of(group)
    members = group.students.map{|student| student.full_name}
    members.to_sentence
  end

  def minutes_to_hours(minutes)
    minutes / 60.to_f
  end
end
