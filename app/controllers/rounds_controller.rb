class RoundsController < ApplicationController
  def show
    @last_winner = params[:winner]
    @result = @last_winner == current_user.username unless @last_winner.nil?
    @round = Round.find(params[:id])
    @game = @round.game
    @participation = Participation.find_by(user: current_user, game: @game)
  end

  def next
    @game = Game.find(params[:game_id])
    redirect_to round_path(@game.rounds.last)
  end
end
