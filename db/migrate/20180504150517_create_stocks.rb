class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :copies, default: 0

      t.belongs_to :shop
      t.belongs_to :book

      t.timestamps
    end
  end
end
