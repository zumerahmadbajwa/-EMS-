# frozen_string_literal: true

# Create Coupon Reference to Products
class AddCouponReferenceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :coupon
  end
end
