require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  def setup
    @movie = Movie.create(title: 'bluehammer', year: 1997)
    @controller = Api::MoviesController.new
  end

  test 'should get index' do
    get :index, format: :json
    body = JSON.parse(response.body)
    assert_response :success
    assert_equal 1, body['movies'].count
  end

  test 'should show movie' do
    get :show, id: @movie, format: :json
    body = JSON.parse(response.body)
    assert_response :success
    assert_equal @movie.id, body['movie']['id']
  end

  test 'should create movie' do
    assert_difference('Movie.count') do
      post :create, title: 'whitescrewdriver', year: 2003, format: :json
      body = JSON.parse(response.body)
      assert_response :success
      assert_not_nil assigns body['id']
    end
  end

  test 'should update movie' do
    patch :update, id: @movie, title: 'yellowhammer', format: :json
    body = JSON.parse(response.body)
    assert_response :success
    assert_equal 'yellowhammer', body['movie']['title']
  end

  test 'should destroy movie' do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie, format: :json
      assert_response :success
    end
  end

  test 'should get movie users' do
    @user = User.create(email: 'testuser@mail.com')
    @user.movies << @movie
    get :users, id: @movie, format: :json
    body = JSON.parse(response.body)
    assert_response :success
    assert_equal 1, body['users'].count
  end
end
