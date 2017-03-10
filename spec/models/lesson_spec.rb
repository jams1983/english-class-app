require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it { should belong_to :group }
  it { should have_many :attendees }

  it { should validate_presence_of :date }
  it { should validate_presence_of :duration }

  it { should accept_nested_attributes_for :attendees }
end
