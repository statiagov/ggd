require 'spec_helper'

describe FacilityType do
  it "has a valid factory" do
    expect(build(:facility_type)).to be_valid
  end

  let(:factory){  build(:facility_type)  }
  describe "ActiveModel validation" do
    it { expect(factory).to validate_presence_of(:name) }
  end

  describe "ActiveRecord associations" do
    it { expect(factory).to have_one(:facility) }
  end
end