class Attendee < ApplicationRecord

  belongs_to :student
  belongs_to :lesson
  belongs_to :attendance_option

end
