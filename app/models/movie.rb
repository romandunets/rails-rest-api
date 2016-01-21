class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  validates :year, presence: true, inclusion: 1800..2100
end
