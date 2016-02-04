class AddScoreToUserMovies < ActiveRecord::Migration
  def change
  	add_column :user_movies, :score, :float, default: 0, null: false
  end
end
