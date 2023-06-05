require 'rails_helper'

RSpec.describe 'New Playlist Page', type: :feature do
  before(:each) do
    visit '/'
  end
  describe 'When I go to create a new playlist' do
    xit 'has a fillable form' do
       expect(page).to have_content("Juke Name")
       expect(page).to have_content("Public? Y/N")
       expect(page).to have_content("Address")
       expect(page).to have_content("Range")
       expect(page).to have_content("Get Started!")
    end

    xit 'I can fill in the form and submit it' do
      #  fill_in "Juke Name", with : "Bob's Playlist"
      #  check "Y"
      #  fill_in "Address", with : "example address"
      #  fill_in "Range", with : ""
      #  click_button "Get Started!"
      #  expect(current_path).to eq()
    end

    xit 'sad path form fillout' do
      #  fill_in "Juke Name", with : ""
      #  check "Y"
      #  fill_in "Address", with : "example address"
      #  fill_in "Range", with : ""
      #  click_button "Get Started!"
      #  expect(page).to have_content("Please fill out all feilds.")
    end
  end
end