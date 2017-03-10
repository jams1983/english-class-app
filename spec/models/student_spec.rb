require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should have_and_belong_to_many :groups }
end
