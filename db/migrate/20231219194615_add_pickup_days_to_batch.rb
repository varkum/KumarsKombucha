class AddPickupDaysToBatch < ActiveRecord::Migration[7.2]
  def change
    add_column :batches, :pickup_days, :text
  end
end
