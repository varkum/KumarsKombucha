class CreateBatches < ActiveRecord::Migration[7.2]
  def change
    create_table :batches do |t|
      t.integer :bottles

      t.timestamps
    end
  end
end
