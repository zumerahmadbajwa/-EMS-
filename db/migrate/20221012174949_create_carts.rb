# frozen_string_literal: true

# Create Cart
class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
