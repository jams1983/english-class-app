class Teacher < User

  has_many :groups
  has_many :price_details

  has_many :lessons, through: :groups

end
