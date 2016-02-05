class ChangeUserMoviesScoreNullable < ActiveRecord::Migration
  def change
  	change_column :user_movies, :score, :float, default: nil, null: true
  end
end
