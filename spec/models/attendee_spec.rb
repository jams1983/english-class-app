require 'rails_helper'

RSpec.describe Attendee, type: :model do

  it { should belong_to :student }
  it { should belong_to :lesson }
  it { should belong_to :attendance_option }

end
