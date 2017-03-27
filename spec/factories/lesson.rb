FactoryGirl.define do
  factory :lesson do
    duration 90
    date { Date.today }
    group
  end
end
