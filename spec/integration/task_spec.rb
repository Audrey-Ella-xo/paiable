# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task management', type: :feature do
  let(:user) { User.create(username: 'maru', name: 'maria', lastname: 'Odiaka', password: 'foobar') }
  scenario 'Invalid Creation' do
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'Project Tasks'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'Create new Task'
    fill_in 'Name', with: ''
    fill_in 'task_activity', with: ''
    click_on 'Create Task'
    sleep(3)
    expect(page).to have_content('Task creation failed.')
  end

  scenario 'Valid Creation' do
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'Project Tasks'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'Create new Task'
    fill_in 'Name', with: 'Task'
    fill_in 'task_activity', with: 'Activity'
    click_on 'Create Task'
    sleep(3)
    expect(page).to_not have_content('Task creation failed.')
  end
end
