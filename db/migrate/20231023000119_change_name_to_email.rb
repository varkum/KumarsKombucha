class ChangeNameToEmail < ActiveRecord::Migration[7.2]
  def change
    change_column :orders, :name, :email
  end
end
