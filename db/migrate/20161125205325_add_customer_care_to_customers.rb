class AddCustomerCareToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :customer_care, :boolean, default: false
  end
end
