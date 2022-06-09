class UsersController < ApplicationController
  def show
    @user = current_user
    @cards = Card.all.sample(3)
    @cards_read_more = Card.all.sample(3)
    @card = Card.all.sample(1)
    @users = User.all
    @users_sorted = User.sort_by_cards.first(5)
  end
end
