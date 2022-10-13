# frozen_string_literal: true

# Add Price to Orders
class AddPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :price, :float
  end
end
