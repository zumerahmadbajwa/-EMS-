# frozen_string_literal: true

# Invitation Controller
class InvitationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.base64(10)
    if @user.save
      UserMailer.send_invitation(@user, @user.password).deliver_later
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
