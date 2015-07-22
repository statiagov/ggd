require 'spec_helper'

describe Services::Inspection::Schedule do

  before(:each) do
    create(:facility)
    create(:inspection_type)
  end

  subject {Services::Inspection::Schedule.call(scheduler_form:inspection)}

  describe "passing in valid params" do
    let(:inspection) {build(:scheduler_form)}
    it "returns a success" do
      expect(subject).to be_success
    end
    it ".inspection should be an Inspection" do
      expect(subject.inspection).to be_a_kind_of(Inspection)
    end

    it "adds an inspection to the database" do
      expect {subject}.to change(Inspection, :count).by(1)
    end
  end

  describe "passing in invalid params" do
    let(:inspection) {build(:scheduler_form, facility:-9999)}
    it "returns a failure" do
      expect(subject).to be_failure
    end
    it "has error messages" do
      expect(subject.errors.messages).to_not be_nil
    end
    it "does not add an inspection to the database" do
      expect {subject}.to change(Inspection, :count).by(0)
    end
  end
end