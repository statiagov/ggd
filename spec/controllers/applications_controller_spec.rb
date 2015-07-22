require 'spec_helper'

describe ApplicationController do
  describe "auto_complete_ids_to_exclude" do
    it "should return [] when related is nil" do
      expect(controller.send(:auto_complete_ids_to_exclude, nil)).to eq([])
    end

    it "should return [] when related is ''" do
      expect(controller.send(:auto_complete_ids_to_exclude, '')).to eq([])
    end

    it "should return [6, 9] when related is 'inspections/7'" do
      allow(controller).to receive(:controller_name).and_return('inspections')
      facility = double(Facility, inspections: [double(id: 6), double(id: 9)])
      expect(Facility).to receive(:find_by_id).with('7').and_return(facility)
      expect(controller.send(:auto_complete_ids_to_exclude, 'facility/7').sort).to eq([6, 9])
    end

    it "should return [] when related object is not found" do
      expect(Facility).to receive(:find_by_id).with('7').and_return(nil)
      expect(controller.send(:auto_complete_ids_to_exclude, 'facility/7')).to eq([])
    end

    it "should return [] when related object association is not found" do
      allow(controller).to receive(:controller_name).and_return('not_a_method_that_exists')
      facility = double(Facility)
      expect(Facility).to receive(:find_by_id).with('7').and_return(facility)
      expect(controller.send(:auto_complete_ids_to_exclude, 'facility/7')).to eq([])
    end
  end
end
