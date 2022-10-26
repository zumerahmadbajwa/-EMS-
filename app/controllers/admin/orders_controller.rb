# frozen_string_literal: true

module Admin
  # Class Orders
  class OrdersController < ApplicationController
    before_action :current_cart
    def index
      @orders = Order.all.order(:created_at)
    end

    def show
      @order = Order.find(params[:id])
    end
  end
end
