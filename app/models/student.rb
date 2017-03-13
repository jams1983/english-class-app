class Student < User

  has_and_belongs_to_many :groups
  has_many :attendees

end
