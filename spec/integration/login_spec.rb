# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign up tests', type: :feature do
  let(:user) { User.create(username: 'Maru', name: 'maria', lastname: 'Odiaka', password: 'foobar') }

  scenario 'Invalid Login' do
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: ''
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
  end

  scenario 'Valid Login' do
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
  end
end
