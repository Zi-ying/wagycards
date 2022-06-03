class UserCardsController < ApplicationController
  def index
    @user = current_user
    if params[:query].present?
      @user_cards = UserCard.search_by_card_characteristic(params[:query])
    else
      @user_cards = UserCard.all
    end
  end
end
