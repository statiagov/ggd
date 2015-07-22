require 'spec_helper'

describe Facility do
  it "has a valid factory" do
    expect(build(:facility)).to be_valid
  end

  let(:factory){build(:facility)}
  describe "ActiveRecord associations" do
    it {expect(factory).to belong_to(:facility_type)}
    it {expect(factory).to belong_to(:establishment)}
    it {expect(factory).to have_many(:inspections)}
  end
end
