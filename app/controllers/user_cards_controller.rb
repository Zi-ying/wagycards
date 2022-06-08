class UserCardsController < ApplicationController
  def index
    @user = current_user
    @deck = UserCard.where(user_id: @user.id)
    if params[:query].present?
      @user_cards = @deck.global_search(params[:query])
    else
      @user_cards = @deck
    end
  end
end
