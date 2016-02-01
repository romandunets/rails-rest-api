require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.create(title: 'bluehammer', year: 1997, description: 'Movie about blue hammer')
  end

  test "should be valid" do
    assert @movie.valid?
  end

  test "title should be present" do
    @movie.title = " "
    assert_not @movie.valid?
  end
end
