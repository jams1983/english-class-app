class LessonsController < ApplicationController

  def index
    @lessons = group.lessons.order(created_at: :desc)
  end

  def new
    @lesson = group.lessons.new
    attendance_options
    build_attendance_list(group, @lesson)
  end

  def create
    @lesson = group.lessons.new(lesson_params[:lesson])
    if @lesson.save
      redirect_to group_lessons_path(group.id)
    else
      attendance_options
      render :new
    end
  end

  private

  def attendance_options
    @attendance_options = AttendanceOption.all
  end

  def lesson_params
    params.permit(lesson: [:date, :duration, attendees_attributes: [:attendance_option_id, :student_id]])
  end

  def build_attendance_list(group, lesson)
    group.students.each do |student|
      lesson.attendees.build(student_id: student.id)
    end
  end

  def group
    @group ||= current_user_groups.find(params[:group_id])
  end

end
