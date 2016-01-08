require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @valid_user = User.new(name: "Luna Lovegood", email: "abc@gmail.com", password: "foobarhello", password_confirmation: "foobarhello" )
    @invalid_user_email_missing = User.new(name: "Luna Lovegood", password: "foobarhello", password_confirmation: "foobarhello")
    @invalid_user_name_missing = User.new(email: "abc@gmail.com", password: "foobarhello", password_confirmation: "foobarhello")
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

  test "user name should not be too long" do
    @valid_user.name="xy"*50
    assert_not @valid_user.valid?

  end

  test "valid email addresses should be accepted" do
    valid_addresses = %w[tina@gmail.com TINAABC@yahoo.com Tina_abc@aol.com]
    valid_addresses.each do |address|
      @valid_user.email = address
      assert @valid_user.valid?
    end
  end

  test "invalid email addresses should be not accepted" do
    invalid_addresses = %w[kitty kitty@ kitty@cat kitty@cat. kitty.com @cat.com ]
    invalid_addresses.each do |address|
      @valid_user.email = address
      assert_not @valid_user.valid?
    end
  end

  test "email address should be unique for users" do
    @duplicate_user = @valid_user.dup
    @valid_user.save
    assert_not @duplicate_user.valid?
  end

  test "email address check on uniqueness should be case insensitive" do
    @duplicate_user = @valid_user.dup
    @valid_user.save
    @duplicate_user.email = @valid_user.email.upcase
    assert_not @duplicate_user.valid?

  end

  test "password should have at least 8 characters" do
    @valid_user.password = @valid_user.password_confirmation = "hello"
    assert_not @valid_user.valid?

  end

end
