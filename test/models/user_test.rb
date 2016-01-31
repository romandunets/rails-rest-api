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

  test "email addresses should be unique" do
    second_user = @user.dup
    second_user.email = @user.email.upcase
    @user.save
    assert_not second_user.valid?
  end

  test "email addresses should be downcase" do
    email = "USER@EXAMPLE.COM"
    @user.email = email
    @user.save
    assert_equal email.downcase, @user.reload.email
  end

  test "should select users by matching movies" do
    @movie = Movie.create(title: 'bluehammer', year: 1997)
    @user_1 = User.create(email: 'testuser1@example.com')
    @user_2 = User.create(email: 'testuser2@example.com')
    
    @user.movies << @movie
    @user_1.movies << @movie

    @user.save
    @user_1.save
    matching_users = User.by_matching_movies(@user.movie_ids, @user.id)

    assert_equal true, matching_users.include?(@user_1)
    assert_equal false, matching_users.include?(@user_2)
  end
end
