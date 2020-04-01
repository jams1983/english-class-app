class Group < ApplicationRecord

  belongs_to :teacher
  has_and_belongs_to_many :students

  has_many :lessons

  validates :name, :level, presence: true, uniqueness: true

  accepts_nested_attributes_for :students

end
