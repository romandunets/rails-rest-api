require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = User.create(email: 'testuser@mail.com')
    @movie = Movie.create(title: 'bluehammer', year: 1997)
    @controller = Api::UsersController.new
  end

  test 'should get index' do
    get :index, format: :json
    body = JSON.parse(response.body)
    assert_response :success
    assert_equal 1, body['users'].count
  end

  test 'should show user' do
    get :show, id: @user, format: :json
    body = JSON.parse(response.body)
    assert_response :success
    assert_equal @user.id, body['user']['id']
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, email: 'testuser1@mail.com', format: :json
      body = JSON.parse(response.body)
      assert_response :success
      assert_not_nil assigns body['id']
    end
  end

  test 'should update user' do
    patch :update, id: @user, email: 'testuser2@mail.com', format: :json
    body = JSON.parse(response.body)
    assert_response :success
    assert_equal 'testuser2@mail.com', body['user']['email']
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user, format: :json
      assert_response :success
    end
  end

  test 'should get user movies' do
    @user.movies << @movie
    get :movies, id: @user, format: :json
    body = JSON.parse(response.body)
    assert_response :success
    assert_equal 1, body['movies'].count
  end

  test 'should add movie for user' do
    assert_difference('@user.movies.count') do
      post :add_movie, id: @user, movie_id: @movie.id, format: :json
      assert_response :success
      assert_not_nil assigns :movie
    end
  end

  test 'should remove movie from user' do
    @user.movies << @movie
    assert_difference('@user.movies.count', -1) do
      post :remove_movie, id: @user, movie_id: @movie.id, format: :json
      assert_response :success
      assert_not_nil assigns :movie
    end
  end

  test 'should get recommended movies for user' do
    @movie_1 = Movie.create(title: 'whitescrewdriver', year: 1997)
    @movie_2 = Movie.create(title: 'greensaw', year: 2003)
    @movie_3 = Movie.create(title: 'greyaxe', year: 2008)

    @user_1 = User.create(email: 'testuser1@example.com')
    @user_2 = User.create(email: 'testuser2@example.com')

    @user.movies << @movie << @movie_1
    @user_1.movies << @movie << @movie_1 << @movie_2
    @user_2.movies << @movie << @movie_2 << @movie_3

    get :recommended_movies, id: @user, format: :json
    body = JSON.parse(response.body)

    assert_response :success
    assert_equal @movie_2.id, body['movies'][0]['movie_id']
    assert_equal 3, body['movies'][0]['rating']
    assert_equal @movie_3.id, body['movies'][1]['movie_id']
    assert_equal 1, body['movies'][1]['rating']
  end
end
