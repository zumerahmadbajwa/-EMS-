# frozen_string_literal: true

# Create AddPriceToOrders
class AddPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :price, :float
  end
end
