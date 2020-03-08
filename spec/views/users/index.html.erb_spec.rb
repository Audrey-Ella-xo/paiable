# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               username: 'Username',
               firstname: 'Firstname',
               lastname: 'Lastname',
               password: 'Passwo'
             ),
             User.create!(
               username: 'Usarname',
               firstname: 'Firstname',
               lastname: 'Lastname',
               password: 'Passwo'
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Username'.to_s, count: 1
    assert_select 'tr>td', text: 'Usarname'.to_s, count: 1
    assert_select 'tr>td', text: 'Firstname'.to_s, count: 2
    assert_select 'tr>td', text: 'Lastname'.to_s, count: 2
    assert_select 'tr>td', text: 'Passwo'.to_s, count: 2
  end
end
