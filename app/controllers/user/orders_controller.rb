# frozen_string_literal: true

class User
  # Orders Controller
  class OrdersController < ApplicationController
    before_action :find_order, only: %i[show]
    skip_before_action :verify_authenticity_token
    def index
      @orders = Order.order(:created_at)
    end

    def show; end

    def new
      value = Coupon.validate_coupon(params[:coupon], current_cart) if params[:coupon].present?
      @coupon = current_cart.sub_total.to_i - value.to_i
      @order = Order.new
    end

    def create
      @order = current_order
      @order.update(order_params)
      current_cart.order_items.each do |item|
        @order.order_items << item
        item.cart_id = nil
        item.save
      end
      if @order.status == 0
        redirect_to user_order_path(order)
      else
        redirect_to root_path
      end
    end

    private

    def find_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :email, :address, :payment, :user_id)
    end
  end
end
