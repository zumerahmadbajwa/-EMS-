# frozen_string_literal: true

module Admin
  # User Controller
  class UsersController < ApplicationController
    before_action :find_user, only: %i[show edit update destroy]
    helper_method :sort_column, :sort_direction

    def index
      @users =
        User.search(params[:search])
            .order("#{sort_column} #{sort_direction}")
            .page params[:page]
      respond_to do |format|
        format.html
        format.xls { send_data @users.to_csv(col_sep: "\t") }
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path
      else
        render 'new'
      end
    end

    def show; end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path
      else
        render 'edit'
      end
    end

    def edit; end

    def destroy
      @user.destroy
      redirect_to admin_users_path
    end

    def delete_modal
      @user = User.find(params[:user_id])
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : 'id'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
  end
end
