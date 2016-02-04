class Movie < ActiveRecord::Base
  has_many :user_movies
  has_many :users, through: :user_movies

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  validates :year, presence: true, inclusion: 1800..2100
  validates :studio, presence: true, length: { maximum: 255 }
end
