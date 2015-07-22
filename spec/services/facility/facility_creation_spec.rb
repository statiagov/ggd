require 'spec_helper'

describe Services::Facility::Create do

  before(:each) do
    create(:establishment)
    create(:facility_type)
  end

  subject {Services::Facility::Create.call(facility_form:facility)}

  describe "passing in valid params" do
    let(:facility) {build(:facility_form)}
    it "returns a success" do
      expect(subject).to be_success
    end
    it ".facility should be a Facility" do
      expect(subject.facility). to be_a_kind_of(Facility)
    end
    it "adds a facility to the database" do
      expect {subject}.to change(Facility, :count).by(1)
    end
  end

  describe "passing in invalid params" do
    let(:facility) {build(:facility_form, facility_type:nil)}
    it "return a failure" do
      expect(subject).to be_failure
    end
    it "has error messages" do
      expect(subject.errors.messages).to_not be_nil
    end
    it "does not add a facility to the database" do
      expect {subject}.to change(Facility, :count).by(0)
    end
  end
end