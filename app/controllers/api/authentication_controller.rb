# frozen_string_literal:true

# Authentication controller for API
class Api::AuthenticationController < Api::ApplicationController
  

  def create
    user = User.find_by(email: params[:user][:email])
    if user.valid_password? params[:user][:password]
      render json: { token: JsonWebToken.encode(sub: user.id) }
    else
      render json: { errors: ['Invalid email or password '] }
    end
  end
end