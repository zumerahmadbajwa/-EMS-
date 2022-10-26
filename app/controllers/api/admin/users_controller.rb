# frozen_string_literal: true

module Api
  # Admin
  module Admin
    # User Controller
    class UsersController < ApplicationController
      before_action :find_user, only: %i[show edit update destroy]
      helper_method :sort_column, :sort_direction
      before_action :authenticate_user!
      before_action :current_cart

      def index
        @users = User.all
      end

      def new; end

      def create
        @user = User.create(user_params)
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
        params.require(:user).permit(:id, :username, :email, :password)
      end

      def sort_column
        User.column_names.include?(params[:sort]) ? params[:sort] : 'id'
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
      end
    end
  end
end
