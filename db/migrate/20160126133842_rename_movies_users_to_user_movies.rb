class RenameMoviesUsersToUserMovies < ActiveRecord::Migration
  def change
  	rename_table :movies_users, :user_movies
  end
end
