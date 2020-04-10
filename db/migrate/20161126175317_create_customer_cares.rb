class CreateCustomerCares < ActiveRecord::Migration[4.2]
  def change
    create_table :customer_cares do |t|
      t.string :name
      t.string :mail
      t.string :subject
      t.string :message

      t.timestamps null: false
    end
  end
end
