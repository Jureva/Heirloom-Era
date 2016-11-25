class AddCustomerIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :customer_id, :integer
  end
end
