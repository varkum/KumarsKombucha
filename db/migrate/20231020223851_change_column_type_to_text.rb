class ChangeColumnTypeToText < ActiveRecord::Migration[7.2]
  def change
    change_column :orders, :comment, :text
  end
end
