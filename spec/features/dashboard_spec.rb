
require File.expand_path("../acceptance_helper.rb", __FILE__)

feature 'Dashboard', '
  In order to monitor activity
  As a user
  I want to see a dashboard

' do
  background do

  end

  scenario "Viewing my dashboard" do
    visit homepage

    # My Tasks
    within "#inspections" do
      expect(page).to have_content('No inspections in the database')
    end
  end

  # scenario "Only show a maximum of 10 entities" do
  #   10.times do
  #     FactoryGirl.create(:task, assignee: @me)
  #     FactoryGirl.create(:opportunity, assignee: @me, stage: 'proposal')
  #     FactoryGirl.create(:account, assignee: @me)
  #   end
  #
  #   visit homepage
  #
  #   # My Tasks
  #   within "#tasks" do
  #     expect(page).to have_content("Not showing 1 hidden task.")
  #   end
  #
  #   # My Opportunities
  #   within "#opportunities" do
  #     expect(page).to have_content("Not showing 1 hidden opportunity.")
  #   end
  #
  #   # My Accounts
  #   within "#accounts" do
  #     expect(page).to have_content("Not showing 1 hidden account.")
  #   end
  # end
end
