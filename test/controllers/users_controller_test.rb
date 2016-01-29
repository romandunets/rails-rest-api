require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = User.create(email: 'testuser@mail.com')
    @movie = Movie.create(title: 'bluehammer', year: 1997)
    @controller = Api::UsersController.new
  end

  test 'should get index' do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns :users
  end

  test 'should show user' do
    get :show, id: @user, format: :json
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, email: 'testuser1@mail.com', format: :json
      assert_response :success
    end
  end

  test 'should update user' do
    patch :update, id: @user, post: { email: 'testuser2@mail.com' }, format: :json
    assert_response :success
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user, format: :json
      assert_response :success
    end
  end

  test 'should get user movies' do
    get :movies, id: @user, format: :json
    assert_response :success
    assert_not_nil assigns :user
  end

  test 'should add movie for user' do
    assert_difference('@user.movies.count') do
      post :add_movie, id: @user, movie_id: @movie.id, format: :json
      assert_response :success
    end
  end

  test 'should remove movie from user' do
    @user.movies << @movie
    assert_difference('@user.movies.count', -1) do
      post :remove_movie, id: @user, movie_id: @movie.id, format: :json
      assert_response :success
    end
  end
end
