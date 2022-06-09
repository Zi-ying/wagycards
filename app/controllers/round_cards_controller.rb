class RoundCardsController < ApplicationController
  def create
    @round = current_user.participations.last.game.rounds.last
    selected_card = params["selected_card"].to_i
    participation_card = ParticipationCard.find(selected_card)
    @round_card = RoundCard.new(round: @round, participation_card: participation_card, progress: "available")
    @round_card.save
    @finished = @round.finished_for?(current_user)
    @result = current_user.participations.last.participation_cards.flat_map {|card| card.round_cards.filter{|card|card.progress == "win"}}.count - current_user.participations.last.participation_cards.flat_map {|card| card.round_cards.filter{|card|card.progress == "loose"}}.count > 0
    if @finished
      @winner = @round.winner(current_user).username
      @round.game.update(progress: "done") if @round.game.is_finished?
    end
    redirect_to round_path(@round.game.rounds.last, winner: @winner)
  end
end
