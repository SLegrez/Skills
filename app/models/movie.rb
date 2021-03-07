class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :title, :year, :genre, :duration, presence: true
  validates :rated, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, presence: true
  validates :duration, numericality: { greater_than_or_equal_to: 45, less_than_or_equal_to: 600 }, presence: true
end
