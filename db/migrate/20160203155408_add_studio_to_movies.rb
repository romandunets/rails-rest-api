class AddStudioToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :studio, :string
  end
end
