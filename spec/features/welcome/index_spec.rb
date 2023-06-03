require 'rails_helper'

describe 'Welcome Index' do
  before :each do
    visit '/'
  end

  describe "Page Display" do
    it "Juke Genie title appears centered at top of page" do
      
      expect(page).to have_content("JukeGenie")
    end
  end
end

