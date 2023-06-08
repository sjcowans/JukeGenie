require 'rails_helper'

RSpec.describe 'User Playlist Show Page', type: :feature do
  before(:each) do
    @user = User.create!(username: "balogna", email: "bologna@hotmail.com", email_confirmed: 1)
    @playlist = 

    visit user_playlist_path(@user, @playlist)
  end

  describe 'when I visit the user playlist show page' do
    it 'I see the name of the playlist' do
      expect(page).to have_content("#{@playlist.name}")
    end
    

    xit 'I see a place to make suggestions' do
      expect(page).to have_link("Make Suggestions!: ")
    end

    xit 'displays an iframe of the playlist' do
      expect(page).to have_content()
    end
  end
end