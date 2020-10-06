class Genre < ApplicationRecord
  has_many :games

  validates :name, uniqueness: true, presence: true
end
