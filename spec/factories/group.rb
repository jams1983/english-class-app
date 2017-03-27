FactoryGirl.define do
  factory :group do
    name Faker::Team.name
    teacher
  end
end
