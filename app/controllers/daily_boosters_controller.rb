class DailyBoostersController < ApplicationController
  def new
    @can_use_booster = true
    if cookies[:booster].present?
      booster = JSON.parse(cookies[:booster])
      if booster["user_id"] == current_user.id && booster["time"] < Time.now
        @next_booster_date = booster["time"].to_datetime
        @can_use_booster = false
      end
    end
    @user_cards = current_user.user_cards.last(4)
  end

  def create
    @cards = Card.order(Arel.sql('RANDOM()')).first(4)
    @daily_booster = @cards.each { |card| current_user.user_cards.create(card: card) }
    cookies[:booster] = JSON.generate({ user_id: current_user.id, time: Time.now })
    @next_booster_date = 24.hours.since
    respond_to do |format|
      format.html { redirect_to user_cards_path }
      format.js { render :create }
    end
  end
end
