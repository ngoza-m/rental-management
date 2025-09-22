class FixTenantForeignKeyOnLeases < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :leases, :tenants
    add_foreign_key :leases, :users, column: :tenant_id
  end
end
