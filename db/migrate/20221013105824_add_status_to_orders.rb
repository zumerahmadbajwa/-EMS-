# frozen_string_literal: true

# Add Status to Orders
class AddStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :integer, default: 1
  end
end
