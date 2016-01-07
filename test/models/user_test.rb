require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @valid_user = User.new(name:"Luna Lovegood", email: "abc@gmail.com")
    @invalid_user_email_missing = User.new(name:"Luna Lovegood")
    @invalid_user_name_missing = User.new(email:"abc@gmail.com")
  end

  test "should be a valid user" do
    assert @valid_user.valid?
  end

  test "should be invalid user if name is missing" do
    assert_not @invalid_user_name_missing.valid?
  end

  test "should be invalid user if email is missing" do
    assert_not @invalid_user_email_missing.valid?
  end
end
