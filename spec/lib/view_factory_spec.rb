
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require "statia_gov/view_factory"

describe StatiaGov::ViewFactory do
  before(:each) do
    StatiaGov::ViewFactory.send(:class_variable_set, '@@views', [])
  end

  describe "initialization" do
    before(:each) do
      @view_params = { name: 'brief', title: 'Brief View', icon: 'fa-bars', controllers: ['inspections'], actions: %w(show index) }
    end

    it "should initialize with required parameters" do
      view = StatiaGov::ViewFactory.new @view_params
      expect(view.name).to eq('brief')
      expect(view.title).to eq('Brief View')
      expect(view.controllers).to include('inspections')
      expect(view.actions).to include('show')
      expect(view.actions).to include('index')
    end

    it "should register view with ViewFactory" do
      expect(StatiaGov::ViewFactory.send(:class_variable_get, '@@views').size).to eq(0)
      StatiaGov::ViewFactory.new @view_params
      expect(StatiaGov::ViewFactory.send(:class_variable_get, '@@views').size).to eq(1)
    end

    it "should not register the same view twice" do
      StatiaGov::ViewFactory.new @view_params
      StatiaGov::ViewFactory.new @view_params
      views = StatiaGov::ViewFactory.send(:class_variable_get, '@@views')
      expect(views.size).to eq(1)
    end
  end

  describe "views_for" do
    before(:each) do
      @v1 = StatiaGov::ViewFactory.new name: 'brief', title: 'Brief View', controllers: ['inspections'], actions: %w(show index)
      @v2 = StatiaGov::ViewFactory.new name: 'long', title: 'Long View', controllers: ['inspections'], actions: ['show']
    end

    it "should return 'brief' view for InspectionsController#index" do
      expect(StatiaGov::ViewFactory.views_for(controller: 'inspections', action: 'index')).to eq([@v1])
    end

    it "should return 'brief' and 'long' view for InspectionsController#show" do
      views = StatiaGov::ViewFactory.views_for(controller: 'inspections', action: 'show')
      expect(views).to include(@v1)
      expect(views).to include(@v2)
    end
  end
end
