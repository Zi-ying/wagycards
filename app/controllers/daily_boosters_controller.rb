class DailyBoostersController < ApplicationController
  def new
  end

  def create
    @cards = Card.order(Arel.sql('RANDOM()')).first(2)
    @cards.each { |card| current_user.user_cards.create(card: card) }
    respond_to do |format|
      format.html { redirect_to user_cards_path }
      format.js { render :create }
    end
  end
end
