require 'rails_helper'

RSpec.describe PriceDetail, type: :model do
  it { should belong_to :teacher }

  it { should validate_presence_of :students_amount }
  it { should validate_presence_of :price }
end
