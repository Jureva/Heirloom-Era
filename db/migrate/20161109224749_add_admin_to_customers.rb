class AddAdminToCustomers < ActiveRecord::Migration[4.2]
  def change
    add_column :customers, :admin, :boolean, default: false
  end
end
