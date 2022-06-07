class Game < ApplicationRecord
  has_many :rounds
  has_many :participations
  validates :progress, presence: true

  def winner
    # self.rounds.count{|round| round.winner}.order.first #&:winner
  end
end
