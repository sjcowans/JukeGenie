require 'rails_helper'

RSpec.describe 'new user' do
  it 'has a new form for user' do
    visit new_user_path

    expect(page).to have_field('Username')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
  end
end