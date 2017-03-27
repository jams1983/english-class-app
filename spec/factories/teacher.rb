FactoryGirl.define do
  factory :teacher do
    email Faker::Internet.email
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password "secret123"
  end
end
