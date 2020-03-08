# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            username: 'Username',
                            firstname: 'Firstname',
                            lastname: '',
                            password: 'Password'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Password/)
  end
end
