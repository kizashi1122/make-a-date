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

  describe "when plan_str is not present on update" do
    before { event.plan_str = "" }
    it { should be_valid }
  end

  describe "when plan_str is not present on create" do
    let (:event2) { Event.new }
    before do
      event2.name = event.name
      event2.description = event.description
      event2.url_param = event.url_param
      event2.plan_str = "" 
    end
    it { event2.should_not be_valid }
  end

end
