class AddCommentsToOrder < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :comment, :string
  end
end