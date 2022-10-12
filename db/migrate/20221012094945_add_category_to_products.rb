# frozen_string_literal: true

# Create Add Category TO Products
class AddCategoryToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category, foreign_key: true
  end
end
