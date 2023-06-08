require 'rails_helper'

RSpec.describe 'User create', type: :feature do
  describe 'user creation' do
    it 'can create a user' do
      visit new_user_path
      fill_in 'Username', with: 'Jojo'
      fill_in 'Email', with: 'Jojo@hotmail.com'
      fill_in 'Password', with: '123'
      click_on 'Create!'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Jojo')
    end

    it 'validates username presence' do
      visit new_user_path
      fill_in 'Email', with: 'Jojo@hotmail.com'
      fill_in 'Password', with: '123'
      click_on 'Create!'

      expect(current_path).to eq(new_user_path)
    end

    it 'validates email presence' do
      visit new_user_path
      fill_in 'Username', with: 'Jojo'
      fill_in 'Password', with: '123'
      click_on 'Create!'

      expect(current_path).to eq(new_user_path)
    end
  end
end

