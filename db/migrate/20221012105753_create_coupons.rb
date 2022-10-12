# frozen_string_literal: true

# Create Coupon
class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
