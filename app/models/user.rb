class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_and_belongs_to_many :movies

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  before_save :downcase_email

  scope :by_matching_movies, -> (movie_ids) {
    joins(:movies).where('movies_users.movie_id IN (?)', movie_ids)
  }

  private

    def downcase_email
      self.email = email.downcase
    end
end