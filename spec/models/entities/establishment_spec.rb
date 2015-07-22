require 'spec_helper'

describe Establishment  do
  it "has a valid factory" do
    expect(build(:establishment)).to be_valid
  end
  let(:factory) {build(:establishment)}
  describe "ActiveRecord Associations" do
    it {expect(factory).to have_many(:facilities)}
  end
end