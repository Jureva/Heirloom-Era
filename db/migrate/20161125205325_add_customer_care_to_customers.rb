class AddCustomerCareToCustomers < ActiveRecord::Migration[4.2]
  def change
    add_column :customers, :customer_care, :boolean, default: false
  end
end
