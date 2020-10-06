class Genre < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
