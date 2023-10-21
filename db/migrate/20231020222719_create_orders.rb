class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :quantity
      t.belongs_to :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
