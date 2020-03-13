# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Project management tests', type: :feature do
  scenario 'Invalid Creation' do
    user = User.create(username: 'maru', name: 'maria', lastname: 'Odiaka', password: 'foobar')
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'All My Projects'
    sleep(3)
    expect(page).to have_content('Total Hours spent on projects')
    click_on 'Add new Project'
    fill_in 'Name', with: ''
    fill_in 'Worked hours', with: ''
    click_button 'Create Project'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
  end

  scenario 'Valid Creation without project or task' do
    user = User.create(username: 'maru', name: 'maria', lastname: 'Odiaka', password: 'foobar')
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'All My Projects'
    sleep(3)
    expect(page).to have_content('Total Hours spent on projects')
    click_on 'Add new Project'
    fill_in 'Name', with: 'New project'
    fill_in 'Worked hours', with: 40
    click_button 'Create Project'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
  end

  scenario 'Valid Creation with task' do
    user = User.create(username: 'maru', name: 'maria', lastname: 'Odiaka', password: 'foobar')
    Task.create(name: 'Task', activity: 'Activity', user_id: user.id)
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
    click_on 'All My Projects'
    sleep(3)
    expect(page).to have_content('Total Hours spent on projects')
    click_on 'Add new Project'
    fill_in 'Name', with: 'New project'
    fill_in 'Worked hours', with: 40
    find('label[for="project_Task"]').click
    click_button 'Create Project'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
  end
end
