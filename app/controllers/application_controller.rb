class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  after_action :update_user_online, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def update_user_online
    current_user.try :touch
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
