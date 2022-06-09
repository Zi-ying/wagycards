class RoundCardsController < ApplicationController
  def create
    @round = current_user.participations.last.game.rounds.last
    selected_card = params["selected_card"].to_i
    participation_card = ParticipationCard.find(selected_card)
    @round_card = RoundCard.new(round: @round, participation_card: participation_card, progress: "available")
    @round_card.save
    @finished = @round.finished_for?(current_user)
    if @finished
      flash[:alert] = "round winner : #{@round.winner(current_user).username}"
      @round.game.update(progress: "done") if @round.game.is_finished?
    end
    redirect_to round_path(@round.game.rounds.last)
  end
end
