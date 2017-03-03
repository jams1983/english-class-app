class Lesson < ApplicationRecord

  belongs_to :group

  has_many :atendees

  validates :date, presence: true

end
