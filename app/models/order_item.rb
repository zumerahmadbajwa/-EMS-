# frozen_string_literal: true

# Order_item model
class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true

  def total_price
    quantity * product.price
  end
end
