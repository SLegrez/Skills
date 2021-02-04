class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, :year, :rated, :duration, :genre, presence: true
end
