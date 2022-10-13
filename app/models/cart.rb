# frozen_string_literal: true

# Cart model
class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy
  # has_many :products, through: :order_items

  belongs_to :user

  def sub_total
    order_items.sum(:total_price)
  end
end
