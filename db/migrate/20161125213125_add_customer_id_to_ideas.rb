class AddCustomerIdToIdeas < ActiveRecord::Migration[4.2]
  def change
    add_column :ideas, :customer_id, :integer
  end
end
