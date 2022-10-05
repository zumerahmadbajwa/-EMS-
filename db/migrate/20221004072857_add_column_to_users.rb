# frozen_string_literal: true

# Add Column To User
class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
  end
end
