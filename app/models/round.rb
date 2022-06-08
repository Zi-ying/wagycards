class Round < ApplicationRecord
  belongs_to :game
  has_many :round_cards

  def winner

  end

  def available_round_cards_for(user)
    self.round_cards
        .joins(participation_card: { user_card: :user })
        .where(user: { id: user.id }, progress: ["available", "draw"])
  end
end
