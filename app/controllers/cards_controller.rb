class CardsController < ApplicationController
  before_action :card_params, only: :show

  def show
  end

  def index
    @cards = Card.all
  end

  private

  def card_params
    @card = Card.find(params[:id])
  end

end
