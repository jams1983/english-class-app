require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { should have_many :groups }
  it { should have_many :price_details }
  it { should have_many :lessons }
  it { should validate_presence_of :password }
end
