# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            username: 'MyString',
                            firstname: 'MyString',
                            lastname: 'Lastname',
                            password: 'String'
                          ))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'user[username]'

      assert_select 'input[name=?]', 'user[firstname]'

      assert_select 'input[name=?]', 'user[lastname]'

      assert_select 'input[name=?]', 'user[password]'
    end
  end
end
