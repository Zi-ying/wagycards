class Game < ApplicationRecord
  has_many :rounds
  has_many :participations
  validates :progress, presence: true

  # def winner
  #   # self.rounds.count{|round| round.winner}.order.first #&:winner
  # end

  def is_finished?
    false
  end

  def opponent_for(user)
    self.participations.where.not(user: user).last.user
  end
end
