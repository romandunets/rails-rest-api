require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "testuser@example.com", first_name: "user", second_name: "test")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 250 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user.@example.com@example.com user@exam+ple.com user@example,com user_at_example.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
