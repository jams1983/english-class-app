class Group < ApplicationRecord

  belongs_to :subject
  has_and_belongs_to_many :users

  validates :name, presence: true
end
