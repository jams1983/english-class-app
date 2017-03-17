class LessonsController < ApplicationController

  def index
    @lessons = group.lessons.order(date: :desc)
  end

  def new
    @lesson = group.lessons.new
    attendance_options
    build_attendance_list(group, @lesson)
  end

  def create
    @lesson = group.lessons.new(lesson_params[:lesson])
    if @lesson.save
      flash[:success] = "Lesson created successfully"
      redirect_to group_lessons_path(group.id)
    else
      flash[:error] = @lesson.errors.full_messages.to_sentence
      attendance_options
      render :new
    end
  end

  def show
    @lesson = group.lessons.includes(attendees: [:student, :attendance_option]).find(params[:id])
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
