class AddPickupDayToOrder < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :pickup_day, :integer
  end
end
