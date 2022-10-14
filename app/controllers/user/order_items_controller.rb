# frozen_string_literal: true

class User
  # Order-Items Controller
  class OrderItemsController < ApplicationController
    def create
      result = CreateOrderItems.call(
        product_id: params[:product_id],
        current_cart: current_cart
      )
      @order_item = result.order_item
      if result.success?
        redirect_to user_cart_path(current_cart)
      else
        redirect_to user_products_path, alert: 'Error: Could not save to cart'
      end
    end

    def destroy
      @order_item = OrderItem.find(params[:id])
      @order_item.destroy
      redirect_to user_cart_path(current_cart)
    end

    private

    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id, :cart_id)
    end
  end
end
