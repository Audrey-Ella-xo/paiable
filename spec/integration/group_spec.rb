# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Group management', type: :feature do
  scenario 'Invalid Creation' do
    user = User.create(username: 'maru', name: 'maria', lastname: 'Odiaka', password: 'foobar')

    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'All My Groups'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'Create new Group'
    fill_in 'Name', with: ''
    attach_file('group_icon', "#{Rails.root}/app/assets/images/chibi.jpeg", visible: false)
    find('[name=commit]').click
    sleep(3)
    expect(page).to have_content('Group creation failed.')
  end

  scenario 'Valid Creation' do
    user = User.create(username: 'maru', name: 'maria', lastname: 'Odiaka', password: 'foobar')

    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'All My Groups'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'Create new Group'
    fill_in 'Name', with: 'Group'
    attach_file('group_icon', "#{Rails.root}/app/assets/images/chibi.jpeg", visible: false)
    find('[name=commit]').click
    sleep(3)
    expect(page).to_not have_content('Group creation failed.')
  end
end
