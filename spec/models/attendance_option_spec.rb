require 'rails_helper'

RSpec.describe AttendanceOption, type: :model do

  it { should validate_presence_of :description }

end
