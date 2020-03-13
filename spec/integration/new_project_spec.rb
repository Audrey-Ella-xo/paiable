# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign up tests', type: :feature do
  let(:user) { User.create(username: 'Maru', name: 'maria', lastname: 'Odiaka', password: 'foobar') }
  let(:group) { Group.create(name: 'Group', icon: 'app/assets/images/chibi.jpeg', user_id: user.id) }
  let(:task) { Task.create(name: 'Task', activity: 'Activity', user_id: user.id) }

  scenario 'Invalid Creation' do
    visit root_path
    click_on 'Log in'
    fill_in 'Username', with: user.username
    click_button 'Log in'
    sleep(3)
    expect(page).to have_content(user.username.to_s)
    click_on 'All My Projects'
    sleep(3)
    expect(page).to have_content('Total Hours spent on projects')
    click_on 'Add new Project'
    fill_in 'name', with: ''
    fill_in 'Worked hours', with: ''
    click_button 'Create Project'
    sleep(3)
    expect(page).to_not have_content(user.username.to_s)
  end

  #   scenario 'Valid Login' do
  #     visit root_path
  #     click_on 'Log in'
  #     fill_in 'Username', with: user.username
  #     click_button 'Log in'
  #     sleep(3)
  #     expect(page).to_not have_content(user.username.to_s)
  #   end
end
