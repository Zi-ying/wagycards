class Game < ApplicationRecord
  has_many :rounds
  has_many :participations

  validates :progress, presence: true
end
