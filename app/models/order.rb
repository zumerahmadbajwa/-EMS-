# frozen_string_literal: true

# Order model
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum status: %i[complete pending]
  validates :name, :email, :address, presence: true
end
