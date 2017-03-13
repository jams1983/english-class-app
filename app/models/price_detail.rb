class PriceDetail < ApplicationRecord

  belongs_to :teacher

  validates :students_amount, presence: true
  validates :price, presence: true

  def price_per_person
    price / students_amount
  end

end
