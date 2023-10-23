class ChangeNameToEmail < ActiveRecord::Migration[7.2]
  def change
    rename_column :orders, :name, :email
  end
end
