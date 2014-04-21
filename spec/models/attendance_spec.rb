require 'spec_helper'

describe Attendance do

#  let(:plan) { FactoryGirl.create(:plan) }
  before do
    @attendance = Attendance.new(mytime: "1\t2\t3": 1, user_name: "aiueo", event_id: 1)
  end

  subject { @attendance }

#  it { should respond_to(:plan_id) }
#  it { should respond_to(:user_id) }
#  it { should respond_to(:status) }

  it { should respond_to(:event_id) }
  it { should respond_to(:user_name) }
  it { should respond_to(:mytime) }
  
  it { should be_valid }

  describe "when status is not present" do
    before { @attendance.status = nil }
    it { should_not be_valid }
  end

  describe "when event_id is not present" do
    before { @attendance.event_id = nil }
    it { should_not be_valid }
  end

  describe "when mytime is not present" do
    before { @attendance.mytime = nil }
    it { should_not be_valid }
  end

end
