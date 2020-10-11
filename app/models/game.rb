class Game < ApplicationRecord
  belongs_to :genre
  belongs_to :publisher
  has_many :game_platforms
  has_many :platforms, through: :game_platforms

  validates :name, :year, :sales, presence: true
  validates :name, uniqueness: true
  validates :year, numericality: { only_integer: true }
  validates :sales, numericality: true

  def self.search_by(search_term)
    where("LOWER(name) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end
