class Movie < ActiveRecord::Base
  has_many :user_movies
  has_many :users, through: :user_movies

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  validates :year, presence: true, inclusion: 1800..2100

  scope :for_users, -> (user_ids) {
    joins(:users).where('movies_users.user_id IN (?)', user_ids)
  }

  scope :not_in, -> (movie_ids) {
    where('movies.id NOT IN (?)', movie_ids)
  }
end
