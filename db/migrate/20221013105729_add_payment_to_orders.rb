# frozen_string_literal: true

# Add Payment to Orders
class AddPaymentToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment, :integer, deafult: 0
  end
end
