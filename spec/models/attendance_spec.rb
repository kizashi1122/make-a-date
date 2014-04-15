require 'spec_helper'

describe Attendance do

  let(:plan) { FactoryGirl.create(:plan) }
  before do
    @attendance = Attendance.new(status: 1, plan_id: plan.id, user_id: 1)
  end

  subject { @attendance }

  it { should respond_to(:plan_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:status) }
  
  it { should be_valid }

  describe "when status is not present" do
    before { @attendance.status = nil }
    it { should_not be_valid }
  end

  describe "when plan_id is not present" do
    before { @attendance.plan_id = nil }
    it { should_not be_valid }
  end

end
