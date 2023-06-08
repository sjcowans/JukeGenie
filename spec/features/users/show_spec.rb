require 'rails_helper'

RSpec.describe 'User show Page', type: :feature do
  describe "when I visit a user's show page" do
    before(:each) do
      @user = User.create!(username: "balogna", email: "bologna@hotmail.com", email_confirmed: 1)
      visit '/dashboard'
    end

    it 'I see a header that has the users name' do
      expect(page).to have_content("#{@user.username}'s Juke Page")
    end
    
    it 'I see a link to create a Juke, join a Juke, and explore nearby Jukes' do
      expect(page).to have_link("New Juke!")
      expect(page).to have_link("Join a Juke!")
      expect(page).to have_link("Explore Nearby Jukes!")
      expect(page).to have_button("Enable 2 Factor Authentication")
    end

    it 'I see a list of current jukes, ones I am hosting and ones I am invited to' do
      expect(page).to have_content("Current Jukes:")
      
      within '#hosted' do
        expect(page).to have_content("Hosted:")
      end

      within '#joined' do
        expect(page).to have_content("Joined:")
      end
    end
  end
    
  describe 'sad path' do
    it 'user cannot go to the dashboard without being logged in' do
      visit '/dashboard'
      
      expect(current_path).to eq('/')
      expect(page).to have_content("Woah There! You need to sign in, yo!")
    end
  end
end
