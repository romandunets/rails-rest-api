require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  def setup
    @movie = Movie.create(title: 'bluehammer', year: 1997)
    @controller = Api::MoviesController.new
  end

  test 'should get index' do
    get :index, format: :json
    assert_response :success
    assert_not_nil assigns :movies
  end

  test 'should show movie' do
    get :show, id: @movie, format: :json
    assert_response :success
  end

  test 'should create movie' do
    assert_difference('Movie.count') do
      post :create, title: 'whitescrewdriver', year: 2003, format: :json
      assert_response :success
    end
  end

  test 'should update movie' do
    patch :update, id: @movie, post: { title: 'yellowhammer' }, format: :json
    assert_response :success
  end
end
