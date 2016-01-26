class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :user_movies
  has_many :movies, through: :user_movies

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  before_save :downcase_email

  scope :by_matching_movies, -> (movie_ids, user_id) {
    joins(:movies).where('user_movies.movie_id IN (?) AND user_movies.user_id <> ?', movie_ids, user_id).group(:user_id)
  }

  scope :count_by_matching_movies, -> (movie_ids) {
    by_matching_movies(movie_ids).group(:user_id).count
  }

  def recommended_movies
    user_ids = User.count_by_matching_movies(movie_ids).keys - [id]
    Movie.not_in(movie_ids).for_users(user_ids).group(:movie_id).count
  end

  private

    def downcase_email
      self.email = email.downcase
    end
end