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
end
