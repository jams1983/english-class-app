require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to :teacher }
  it { should have_many :lessons }
  it { should have_and_belong_to_many :students }

  it { should validate_presence_of :name }
end
