require_relative 'acceptance_helper'

feature 'Inspetions', '
  In order to increase employee workflow
  As a user
  I want to manage inspections

' do

  scenario 'should view a list of inspections', js:true do
    create_list(:inspection, 3)
    visit inspections_page

    expect(page).to have_content('INSP-SSS1-1')
    expect(page).to have_content('INSP-SSS2-2')
    expect(page).to have_content('INSP-SSS3-3')

    expect(page).to have_content('Create Inspection')
  end

  scenario 'should create an inspection', js: false do
      visit inspections_page
      click_link 'Create Inspection'
      # expect(page).to have_selector('#campaign_name', visible: true)
      # fill_in 'campaign_name', with: 'Cool Campaign'
      # select 'On Hold', from: 'campaign_status'
      # click_link 'Comment'
      # fill_in 'comment_body', with: 'This campaign is very important'
      # click_button 'Create Campaign'
      #
      # expect(page).to have_content('Cool Campaign')
      # expect(page).to have_content('On Hold')
      #
      # find('div#campaigns').click_link 'Cool Campaign'
      # expect(page).to have_content('This campaign is very important')
      #
      # click_link "Dashboard"
      expect(page).to have_content("Bill Murray created campaign Cool Campaign")
      expect(page).to have_content("Bill Murray created comment on Cool Campaign")
  end

  # scenario "remembers the comment field when the creation was unsuccessful", js: true do
  #   visit campaigns_page
  #   click_link 'Create Campaign'
  #
  #   click_link 'Comment'
  #   fill_in 'comment_body', with: 'This campaign is very important'
  #   click_button 'Create Campaign'
  #
  #   expect(find('#comment_body')).to have_content('This campaign is very important')
  # end
  #
  # scenario 'should view and edit a campaign', js: true do
  #   FactoryGirl.create(:campaign, name: "My Cool Campaign")
  #   with_versioning do
  #     visit campaigns_page
  #     click_link 'My Cool Campaign'
  #     click_link 'Edit'
  #     fill_in 'campaign_name', with: 'My Even Cooler Campaign'
  #     select 'Started', from: 'campaign_status'
  #     click_button 'Save Campaign'
  #     expect(page).to have_content('My Even Cooler Campaign')
  #     expect(page).to have_content('My Even Cooler Campaign')
  #     click_link 'Dashboard'
  #     expect(page).to have_content("Bill Murray updated campaign My Even Cooler Campaign")
  #   end
  # end
  #
  # scenario 'should delete a campaign', js: true do
  #   FactoryGirl.create(:campaign, name: "Old Campaign")
  #   visit campaigns_page
  #   click_link 'Old Campaign'
  #   click_link 'Delete?'
  #   expect(page).to have_content('Are you sure you want to delete this campaign?')
  #   click_link 'Yes'
  #   expect(page).to have_content('Old Campaign has been deleted.')
  #   expect(find('div#campaigns')).not_to have_content('Old Campaign')
  # end
  #
  scenario 'should filter on inspection state', js: false do
    create_list(:inspection, 3)
    visit inspections_page
    uncheck('Scheduled')
    check('Completed')
    expect(page).to_not have_content('INSP-SSS1-1')
  end
end
