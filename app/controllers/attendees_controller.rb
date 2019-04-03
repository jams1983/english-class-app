class AttendeesController < EnglishController

  def index
    @date = parse_date_from_params(params[:date]) || Date.today
    attendees
  end

  protected

  def attendees
    @attendees ||= student.attendees
                .joins(:lesson)
                .where( lessons: {
                  date: @date.beginning_of_month..@date.end_of_month
                })
                .order("lessons.date")
  end

  def student
    @student ||= current_user.is_a?(Student) ? current_user : Student.find(params[:student_id])
  end
end
