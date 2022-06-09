class Game < ApplicationRecord
  has_many :rounds
  has_many :participations
  has_many :round_cards, through: :rounds
  validates :progress, presence: true

  def is_finished?
    round_cards.count == 16
  end

  def opponent_for(user)
    participations.where.not(user: user).last.user
  end
end
