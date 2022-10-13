# frozen_string_literal: true

# Create Order Items Interactor
class CreateOrderItems < ApplicationInteractor
  delegate :product_id, :current_cart, :current_order, to: :context

  def call
    chosen_product = Product.find(product_id)
    context.order_item = if current_cart.products.include?(chosen_product)
                           current_cart.order_items.find_by(product_id: chosen_product).increment!(:quantity)
                         else
                           OrderItem.create(cart: current_cart, product: chosen_product, order: current_order)
                         end
  end
end
