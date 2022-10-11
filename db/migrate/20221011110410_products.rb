class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
