class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login password])
  end

  private

  def user_not_authorized(_exception)
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end
end
