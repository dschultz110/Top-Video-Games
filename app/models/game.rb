class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :publisher
  has_many :game_platforms
  has_many :platforms, through: :game_platforms

  validates :name, :year, :sales, presence: true
  validates :year, numericality: { only_integer: true }
  validates :sales, numericality: true
end