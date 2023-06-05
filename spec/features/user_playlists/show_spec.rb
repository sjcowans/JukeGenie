require 'rails_helper'

RSpec.describe 'User Playlist Show Page', type: :feature do
  # before(:each) do
  #   user = 
  #   playlist = 
  #   u_p = 

  #   visit ''
  # end
  describe 'when I visit the user playlist show page' do
    xit 'I see the name of the playlist' do
      expect(page).to have_content("Juke Name")
    end
    
    xit 'I see the current song that is playing' do
      within('#current_song') do
        
      end
    end

    xit 'I see a place to make suggestions' do
      expect(page).to have_content("Make Suggestions!: ")
      expect(page).to have_link()
    end
    
    
    xit 'I see a list of the songs that are comming up along with their info' do
      within('#queued_songs') do
        expect(page).to have_content("Coming Up:")

      end

      xit 'I see the code for the playlist that others can use to join' do
        expect(page).to have_content("code: ")
      end
    end
  end
end