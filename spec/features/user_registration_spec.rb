require 'rails_helper'

RSpec.feature 'User Registration', type: :feature do
  scenario 'user registers with valid information' do
    visit new_user_registration_path

    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'user registers with invalid information' do
    visit new_user_registration_path

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
