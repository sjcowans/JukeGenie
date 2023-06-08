require 'rails_helper'

describe 'Welcome Index' do
  before :each do
    visit '/'
  end

  describe "Page Display" do
    it "Juke Genie title appears centered at top of page and a log in link" do
      expect(page).to have_content("JukeGenie")
      expect(page).to have_link("Log In")
    end

    it 'has an image of a spotify playlist' do
      expect(page).to have_css("img[src*='playlists']")
    end

    it 'Has a section explaing what JukeGenie' do
      expect(page).to have_content("What is JukeGenie?")
      expect(page).to have_content("Sign up with our app to exeprience a whole new way to socially discover music and create spotify playlists! JukeGenie will allow you to start Jukes that other people can join, then recommend songs, artists or genres to your Juke. When you find you have enough suggestions, you will be able to create a completely new playlist that shows up in your spotify account based on the recommendations you have received. If you make a private juke, you can invite other friends by providing them your Juke code. If you are daring or explorative, you can create a public Juke, share your location and prefered range with our app and any Juke users within that range will be able to join your Juke to provide recommendations. You can also discover the Jukes in your area and provide them recommendations. So what are you waiting for!? Click the Log In button to start discovering a whole new range of music!")
    end
  end
end

