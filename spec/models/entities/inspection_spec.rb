require 'spec_helper'

describe Inspection do
  it "has a valid factory" do
    expect(build(:inspection)).to be_valid
  end


  describe "ActiveRecord associations" do
    let(:factory){ build(:inspection) }
    it {expect(factory).to belong_to(:inspection_type)}
    it {expect(factory).to belong_to(:facility)}
    it {expect(factory).to have_many(:inspection_transitions)}
  end

  describe "public instance methods" do
    let(:factory){create(:inspection) }
    context "responds to its method" do
      it{expect(factory).to respond_to(:date_range)}
      it{expect(factory).to respond_to(:inspection_number)}
    end
    context "executes methods correctly" do
      context "#date_range" do
        it "returns the date range beteen the start and end date" do
          expect(factory.date_range).to eq(factory.start_date..factory.end_date)
        end
      end
      context "#inspection_number" do
        it "return a unique identifer for an inspection" do
          expect(factory.inspection_number).to include(factory.id.to_s(16))
        end
      end
    end
  end

  describe "public class methods" do
    before {create_list(:inspection)}
    context "responds to its method" do
      it{expect(Inspection).to respond_to(:search)}
    end
    context "executes methods correctly" do
      context "#search" do
        it "it filters on param[:filter] " do
          params = {}
          expect(Inspection.search(params)).to_not include()
        end
      end
    end
  end

  describe "state_machine transistions" do
    let(:factory){create(:inspection) }
    it "returns :scheduled as the initial state" do
      expect(factory.state_machine.current_state).to eq('scheduled')
    end
  end
end

