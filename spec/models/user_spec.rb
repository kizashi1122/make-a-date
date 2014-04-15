require 'spec_helper'

describe User do
  let(:event) { FactoryGirl.create(:event) }

  before do
    @user = User.new(name: "name", comment: "comment", event_id: event.id)
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:comment) }
  it { should respond_to(:event_id) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = "" }
    it { should_not be_valid }
  end
  describe "when event_id is not present" do
    before { @user.event_id = nil }
    it { should_not be_valid }
  end

end
