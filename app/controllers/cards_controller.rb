class CardsController < ApplicationController
  before_action :card_params, only: :show

  def show
  end

  def index
    if params[:query].present?
      @cards = Card.search_by_card_characteristic(params[:query])
    else
      @cards = Card.all
    end
  end

  private

  def card_params
    @card = Card.find(params[:id])
  end

end
