# frozen_string_literal: true

# Application Controller
class Api::ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_default_format

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login password])
  end

  def set_default_format
    request.format = :json
  end
  private

  def user_not_authorized(_exception)
    redirect_to root_path, alert: 'You are not authorized to perform this action.'
  end

  def current_cart
    @current_cart ||= current_user.ensure_cart
  end
  helper_method :current_cart

  def current_order
    order = Order.where(user_id: current_user.id).last
    return Order.create(user_id: current_user.id) if order.nil?

    order.status == 'complete' ? Order.create(user_id: current_user.id) : order
  end
end
