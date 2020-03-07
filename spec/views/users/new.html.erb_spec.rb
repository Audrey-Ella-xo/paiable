require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :username => "MyString",
      :firstname => "MyString",
      :lastname => "",
      :password => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[firstname]"

      assert_select "input[name=?]", "user[lastname]"

      assert_select "input[name=?]", "user[password]"
    end
  end
end
