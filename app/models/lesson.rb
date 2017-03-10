class Lesson < ApplicationRecord

  belongs_to :group

  has_many :attendees, inverse_of: :lesson

  validates :date, presence: true
  validates :duration, presence: true

  accepts_nested_attributes_for :attendees

  def attendance_summary
    attendance = attendees.joins(:attendance_option).group("attendance_options.description").count
    attendance.map {|reason, amount| "#{reason}: #{amount}"}.to_sentence
  end

end
