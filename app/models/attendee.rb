class Attendee < ApplicationRecord

  belongs_to :student
  belongs_to :lesson
  belongs_to :attendance_option

  before_save :set_percentages

  private

  def set_percentages
    self.koombea_perc = self.attendance_option.koombea_perc
    self.student_perc = self.attendance_option.student_perc
  end

end
