require 'spec_helper'

describe Attendance do

  mytime_arr = ['1','2','3']

  before do
    @attendance = Attendance.new(mytime_arr: mytime_arr, mytime: mytime_arr.join("\t"), user_name: "aiueo", event_id: 1)
  end

  subject { @attendance }

  it { should respond_to(:event_id) }
  it { should respond_to(:user_name) }
  it { should respond_to(:mytime) }
  
  it { should be_valid }

  describe "when user name is not present" do
    before { @attendance.user_name = nil }
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
