class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @game = @round.game
    @participation = Participation.find_by(user: current_user, game: @game)
  end

  def next
    @game = Game.find(params[:game_id])
    redirect_to round_path(@game.rounds.last)
  end
end
