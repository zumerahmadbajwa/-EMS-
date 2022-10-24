# frozen_string_literal: true

# Create AddStatusToOrders
class AddStatusToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :integer, default: 1
  end
end
