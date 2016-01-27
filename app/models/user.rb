class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :user_movies
  has_many :movies, through: :user_movies

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  before_save :downcase_email

  scope :by_matching_movies, -> (movie_ids, user_id) {
    joins(:movies).where('user_movies.movie_id IN (?) AND user_movies.user_id <> ?', movie_ids, user_id).group(:user_id)
  }

  def recommended_movies
    ratings = {}

    matching_users = User.by_matching_movies(movie_ids, id)
    user_ratings = matching_users.count
    user_movies = UserMovie.for_users_with_movies(matching_users.ids, movie_ids)

    user_movies.each do |user_movie|
      if ratings.has_key?(user_movie.movie_id)
        ratings[user_movie.movie_id] += user_ratings[user_movie.user_id]
      else
        ratings[user_movie.movie_id] = user_ratings[user_movie.user_id]
      end
    end

    ratings
  end

  private

    def downcase_email
      self.email = email.downcase
    end
end