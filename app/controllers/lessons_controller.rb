class LessonsController < EnglishController
  before_action :redirect_to_student_root_path,
                if: -> { current_user.is_a?(Student) }

  def index
    @date = parse_date_from_params(params[:date]) || Date.today
    @lessons = group.lessons.where(date: @date.beginning_of_month..@date.end_of_month).order(date: :desc)
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
    @lesson = find_lesson
  end

  def edit
    @lesson = find_lesson
    attendance_options
  end

  def update
    @lesson = find_lesson
    if @lesson.update_attributes(lesson_params[:lesson])
      flash[:success] = "Lesson updated successfully"
      redirect_to group_lesson_path(group.id, @lesson.id)
    else
      flash[:error] = @lesson.errors.full_messages.to_sentence
      attendance_options
      render :edit
    end
  end

  private

  def find_lesson
    group.lessons.includes(attendees: [:student, :attendance_option]).find(params[:id])
  end

  def attendance_options
    @attendance_options ||= AttendanceOption.order(:id)
  end

  def lesson_params
    params.permit(lesson: [:date, :duration, :note, attendees_attributes: [:id, :attendance_option_id, :student_id, :note]])
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
