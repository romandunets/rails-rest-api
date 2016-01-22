class Movie < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  validates :year, presence: true, inclusion: 1800..2100
end
