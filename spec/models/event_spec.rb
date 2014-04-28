require 'spec_helper'

describe Event do

  let(:event) { FactoryGirl.create(:event) }

  subject { event }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:url_param) }
  it { should respond_to(:plan_str) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { event.name = "" }
    it { should_not be_valid }
  end

  describe "when plan_str is not present" do
    before { event.plan_str = "" }
    it { should_not be_valid }
  end


end
