class CardsController < ApplicationController
  def show
    @cards = Card.all
  end

  def index
  end
end
