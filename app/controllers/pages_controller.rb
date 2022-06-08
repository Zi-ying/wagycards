class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @card_alumni = Card.all.where(status: 'alumni').sample(1)
    @card_ta = Card.all.where(status: 'TA').sample(1)
    @card_teacher = Card.all.where(status: 'Teacher').sample(1)
    @card_founder = Card.all.where(status: 'Founder').sample(1)
  end
end
