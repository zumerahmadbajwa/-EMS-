# frozen_string_literal: true

# User Reference To Cart
class UserReferenceToCart < ActiveRecord::Migration[5.2]
  def change
    add_reference :carts, :user, foreign_key: true
  end
end
