class GamesController < ApplicationController

  def create
    @game = Game.find_by(progress: "pending")
    if @game
      @game.progress = "playing"
      @game.save
    else
      @game = Game.create(progress: "pending")
    end
    Participation.create(user: current_user, game: @game)
    @round = Round.create(game: @game)
    redirect_to round_path(@round)
  end
end
