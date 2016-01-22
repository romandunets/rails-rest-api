class CreateMoviesUsers < ActiveRecord::Migration
  def change
    create_table :movies_users, id: false do |t|
      t.integer :movie_id
      t.integer :user_id
    end

    add_index :movies_users, [:movie_id, :user_id]
  end
end
