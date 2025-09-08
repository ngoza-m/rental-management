class AddColumnsToTenants < ActiveRecord::Migration[7.2]
  def change
    add_column :tenants, :name, :string
    add_column :tenants, :ID, :string
    add_column :tenants, :contact, :string
    add_column :tenants, :emergency_contact, :string
  end
end
