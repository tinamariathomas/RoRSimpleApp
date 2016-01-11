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

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "mypassword",
                                            password_confirmation: "mypassword" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
