class OrdersTextToDescription < ActiveRecord::Migration
  def change
    rename_column :orders, :text, :description
  end
end
