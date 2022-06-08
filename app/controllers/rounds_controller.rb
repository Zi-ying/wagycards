class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @game = @round.game
    @participation = Participation.find_by(user: current_user, game: @game)
  end
end
