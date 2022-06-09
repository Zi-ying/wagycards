class UserCardsController < ApplicationController
  def index
    @user = current_user
    @deck = UserCard.where(user_id: @user.id)
    if @deck.count < 8
      @cards = Card.order(Arel.sql('RANDOM()')).first(8)
      @cards.each { |card| @user.user_cards.create(card: card) }
    end
    if params[:query].present?
      @user_cards = @deck.global_search(params[:query])
    else
      @user_cards = @deck
    end
  end
end
