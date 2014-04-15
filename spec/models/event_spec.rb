require 'spec_helper'

describe Event do

  before do
    @event = Event.new(name: "Some Event", description: "2014/1/1\n2014/1/2", plan_str: "2014/1/1\n2014/1/2")
  end

  subject { @event }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:url_param) }
  it { should respond_to(:plan_str) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @event.name = "" }
    it { should_not be_valid }
  end

  describe "when plan_str is not present" do
    before { @event.plan_str = "" }
    it { should_not be_valid }
  end


end
