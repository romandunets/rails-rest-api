class UserMovie < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  scope :for_users_with_movies, -> (user_ids, movie_ids) {
    where('user_id IN (?) AND movie_id NOT IN (?)', user_ids, movie_ids)
  }
end
