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

  test "title should not be too long" do
    @movie.title = "a" * 256
    assert_not @movie.valid?
  end

  test "title should be unique" do
    second_movie = @movie.dup
    second_movie.title = @movie.title.upcase
    @movie.save
    assert_not second_movie.valid?
  end

  test "year should be present" do
    @movie.year = nil
    assert_not @movie.valid?
  end

  test "year should be greater or equal to 1800" do
    @movie.year = 1799
    assert_not @movie.valid?
  end

  test "year should be less or equal to 2100" do
    @movie.year = 2101
    assert_not @movie.valid?
  end
end
