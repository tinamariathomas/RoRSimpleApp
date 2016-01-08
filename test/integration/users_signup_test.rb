require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid user signup" do
    get signup_path
    before_count = User.count
    post users_path, user: {name: "", email: "jesse@fullhouse", password: "foo", password_confirmation: "foo"}
    after_count = User.count
    assert_equal before_count,after_count
    assert_template 'users/new'
  end

end
