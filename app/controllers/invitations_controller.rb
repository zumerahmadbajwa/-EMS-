# frozen_string_literal: true

# Invitation Controller
class InvitationsController < ApplicationController
  # skip_before_action :confirmable, only: :create

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.base64(10)
    UserMailer.send_invitation(@user, @user.password).deliver_later if @user.save
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = (User.find(params[:id]) if params[:id].present?)
  end

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
