class Platform < ApplicationRecord
  has_many :game_platforms
  has_many :games, through: :game_platforms

  validates :name, uniqueness: true, presence: true
end
