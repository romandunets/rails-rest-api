class Movie < ActiveRecord::Base
  has_many :user_movies
  has_many :users, through: :user_movies

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  validates :year, presence: true, inclusion: 1800..2100
  validates :duration, presence: true, inclusion: 0..21600
  validates :studio, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  def average_score
    user_movies.average(:score).to_f.round(2)
  end
end
