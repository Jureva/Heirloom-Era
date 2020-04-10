class CreateFeedbacks < ActiveRecord::Migration[4.2]
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.references :customer,  foreign_key: true #index: true,

      t.timestamps #null: false
    end
    add_index :feedbacks, [:customer_id, :created_at]
  end
end
