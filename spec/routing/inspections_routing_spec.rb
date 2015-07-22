
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InspectionsController do
  describe "routing" do
    it "recognizes and generates #index" do
      expect(get: "/inspections").to route_to(controller: "inspections", action: "index")
    end

    it "recognizes and generates #new" do
      expect(get: "/inspections/new").to route_to(controller: "inspections", action: "new")
    end

    it "recognizes and generates #show" do
      expect(get: "/inspections/1").to route_to(controller: "inspections", action: "show", id: "1")
    end

    it "doesn't recognize #show with non-numeric id" do
      expect(get: "/inspections/aaron").not_to be_routable
    end

    it "recognizes and generates #edit" do
      expect(get: "/inspections/1/edit").to route_to(controller: "inspections", action: "edit", id: "1")
    end

    it "doesn't recognize #edit with non-numeric id" do
      expect(get: "/inspections/aaron/edit").not_to be_routable
    end

    it "recognizes and generates #create" do
      expect(post: "/inspections").to route_to(controller: "inspections", action: "create")
    end

    it "recognizes and generates #update" do
      expect(put: "/inspections/1").to route_to(controller: "inspections", action: "update", id: "1")
    end

    it "doesn't recognize #update with non-numeric id" do
      expect(put: "/inspections/aaron").not_to be_routable
    end

    it "recognizes and generates #destroy" do
      expect(delete: "/inspections/1").to route_to(controller: "inspections", action: "destroy", id: "1")
    end

    it "doesn't recognize #destroy with non-numeric id" do
      expect(delete: "/inspections/aaron").not_to be_routable
    end

    it "recognizes and generates #auto_complete" do
      expect(get: "/inspections/auto_complete").to route_to(controller: "inspections", action: "auto_complete")
    end

    it "recognizes and generates #filter" do
      expect(post: "/inspections/filter").to route_to(controller: "inspections", action: "filter")
    end
  end
end
