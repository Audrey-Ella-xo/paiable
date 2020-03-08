# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign up tests', type: :feature do
  let(:user) { User.create(username: 'Maru', firstname: 'maria', lastname: 'Odiaka', password: 'foobar') }

  scenario 'Valid Signup' do
    visit root_path
    click_on 'Sign up now!'
    sleep(3)
    expect(page).to have_content('New User')
    fill_in 'Username', with: 'JohnDoe'
    fill_in 'Firstname', with: 'John'
    fill_in 'Lastname', with: 'Doe'
    fill_in 'Password', with: 'Johnie'
    click_button 'Create User'
    sleep(3)
    expect(page).to have_content('User was successfully created.')
  end

  scenario 'Invalid Signup' do
    visit root_path
    click_on 'Sign up now!'
    sleep(3)
    expect(page).to have_content('New User')
    fill_in 'Username', with: ''
    fill_in 'Firstname', with: 'John'
    fill_in 'Lastname', with: 'Doe'
    fill_in 'Password', with: 'Johnie'
    click_button 'Create User'
    sleep(3)
    expect(page).to have_content("Username can't be blank")
  end
end
