class RoundsController < ApplicationController
  def show
    @user_participation = Participation.where(game: @game).where.not(user_id: current_user.id).map(&:user).first
    @round = Round.find(params[:id])
    @game = @round.game
    @participation_cards = Participation.find_by(user: current_user, game: @game)
  end
end
