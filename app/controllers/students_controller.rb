class StudentsController < EnglishController
  before_action :redirect_to_student_root_path, if: -> { current_user.is_a?(Student) }

  def update
    unless student.groups.include?(group)
      prev_group.students.delete(student)
      student.groups << group
    end
  end

  private

  def group
    @group ||= Group.find params[:group_id]
  end

  def student
    @student ||= Student.find params[:id]
  end

  def prev_group
    @prev_group ||= current_user_groups.find params[:prev_group]
  end
end
