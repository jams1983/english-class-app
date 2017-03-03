class Subject < ApplicationRecord

  belongs_to :teacher

  has_many :groups

  validates :name, presence: true
end
