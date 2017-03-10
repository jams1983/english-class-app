class PriceDetail < ApplicationRecord

  belongs_to :teacher

  validates :students_amount, presence: true
  validates :price, presence: true

end
