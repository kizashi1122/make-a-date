require 'spec_helper'

describe Plan do

  let(:event) { FactoryGirl.create(:event) }

  before do
    @plan = Plan.new(datetime: "2012.3.3", event_id: event.id)
  end

  subject { @plan }

  it { should respond_to(:datetime) }
  it { should respond_to(:event_id) }
  
  it { should be_valid }

  describe "when datetime is not present" do
    before { @plan.datetime = "" }
    it { should_not be_valid }
  end
  describe "when event_id is not present" do
    before { @plan.event_id = nil }
    it { should_not be_valid }
  end

end
