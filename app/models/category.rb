# frozen_string_literal: true

# Category
class Category < ApplicationRecord
  validates :name, presence: true

  has_many :products
end
