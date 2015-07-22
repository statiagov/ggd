require 'spec_helper'

describe InspectionType do
  it "has a valid factory" do
    expect(build(:inspection_type)).to be_valid
  end

  let(:factory){ build(:inspection_type) }
  describe "ActiveModel validation" do
    it { expect(factory).to validate_presence_of(:name) }
  end

  describe "ActiveRecord associations" do
    it { expect(factory).to have_one(:inspection) }
  end
end
