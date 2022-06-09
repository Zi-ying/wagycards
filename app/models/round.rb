class Round < ApplicationRecord
  belongs_to :game
  has_many :round_cards

  def winner(user)
    winner = nil
    game = self.game
    opponent = game.opponent_for(user)
    user_round_card = self.played_round_cards_for(user).last
    opponent_round_card = self.played_round_cards_for(opponent).last
    if opponent_round_card && user_round_card
      result = opponent_round_card.points - user_round_card.points
      if result.positive?
        winner = opponent
      else
        winner = user
      end
    end
    winner
  end

  def finished_for?(user)
    game = self.game
    opponent = game.opponent_for(user)
    user_round_card = self.available_round_cards_for(user).last
    opponent_round_card = self.available_round_cards_for(opponent).last
    finished = false
    if opponent_round_card && user_round_card && self.available_round_cards_for(user).count == self.available_round_cards_for(opponent).count
      result = opponent_round_card.points - user_round_card.points
      if result.zero?
        user_round_card.update(progress: "draw")
        opponent_round_card.update(progress: "draw")
      elsif result.positive?
        user_round_card.update(progress: "loose")
        opponent_round_card.update(progress: "win")
        finished = true
        Round.create(game: game)
      else
        user_round_card.update(progress: "win")
        opponent_round_card.update(progress: "loose")
        finished = true
        Round.create(game: game)
      end
    end
    finished
  end

  def available_round_cards_for(user)
    self.round_cards
        .joins(participation_card: { user_card: :user })
        .where(user: { id: user.id }, progress: ["available", "draw"])
  end

  def played_round_cards_for(user)
    self.round_cards
        .joins(participation_card: { user_card: :user })
        .where(user: { id: user.id }, progress: ["win", "loose"])
  end
end
