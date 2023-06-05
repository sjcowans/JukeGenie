require 'rails_helper'

RSpec.describe 'User show Page', type: :feature do
  before(:each) do
    user = User.create!()
    visit '/dashboard'
  end

  describe "when I visit a user's show page" do
    xit 'I see a header that has the users name' do
      expect(page).to have_content("#{user.name} Juke Page")
    end
    
    xit 'I see a link to create a Juke, join a Juke, and explore nearby Jukes' do
      expect(page).to have_link("New Juke!")
      expect(page).to have_link("Join a Juke!")
      expect(page).to have_link("Explore Nearby Jukes!")
    end

    xit 'I see a list of current jukes, ones I am hosting and ones I am invited to' do
      expect(page).to have_content("Current Jukes:")
      within '#hosted' do
        expect(page).to have_content("Hosted:")
        expect(page).to have_link()
      end

      within '#invited' do
        expect(page).to have_content("Invited:")
        expect(page).to have_link()
      end
    end

    xit 'user cannot go to the dashboard without being logged in' do
      
    end
  end
end
