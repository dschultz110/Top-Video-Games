class Platform < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
