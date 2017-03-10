module ApplicationHelper

  def members_of(group)
    members = group.students.map{|student| student.full_name}
    members.to_sentence
  end
end
