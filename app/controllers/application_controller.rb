class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :update_user_online, if: :user_signed_in?

  private

  def update_user_online
    current_user.try :touch
  end
end
