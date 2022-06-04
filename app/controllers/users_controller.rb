class UsersController < ApplicationController
  def show
    @user = current_user
    @cards = Card.all.sample(3)
    @card = Card.all.sample(1)
    @users = User.all
  end
end
