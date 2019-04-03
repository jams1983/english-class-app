class Lesson < ApplicationRecord

  belongs_to :group

  has_many :attendees, inverse_of: :lesson

  validates :date, presence: true
  validates :duration, presence: true

  validates :date, uniqueness: {scope: :group_id, message: "has a lesson registered for this group"}

  accepts_nested_attributes_for :attendees

  def billable_attendees_amount
    attendees.joins(:attendance_option).where(attendance_options: { bill: true }).count
  end

  def attendance_summary
    attendance = attendees.joins(:attendance_option).group("attendance_options.description").count
    attendance.map {|reason, amount| "#{reason}: #{amount}"}.to_sentence
  end

end
