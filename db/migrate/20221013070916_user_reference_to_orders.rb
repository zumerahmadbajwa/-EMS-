# frozen_string_literal: true

# User Reference To Order
class UserReferenceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user, foreign_key: true
  end
end
