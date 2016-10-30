class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
