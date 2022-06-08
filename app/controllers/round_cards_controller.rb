class RoundCardsController < ApplicationController
  def create
    @round = current_user.participations.last.game.rounds.last
    selected_card = params["selected_card"].to_i
    participation_card = ParticipationCard.find(selected_card)
    @round_card = RoundCard.new(round: @round, participation_card: participation_card, progress: "available")
    @round_card.save
    redirect_to round_path(@round)
  end
end
