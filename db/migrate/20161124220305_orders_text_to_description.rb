class OrdersTextToDescription < ActiveRecord::Migration[4.2]
  def change
    rename_column :orders, :text, :description
  end
end
