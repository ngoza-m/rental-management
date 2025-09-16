class AddStatusToLeases < ActiveRecord::Migration[7.2]
  def change
    add_column :leases, :status, :integer
  end
end
