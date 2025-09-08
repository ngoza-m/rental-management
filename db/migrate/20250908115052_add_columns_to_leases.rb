class AddColumnsToLeases < ActiveRecord::Migration[7.2]
  def change
    add_column :leases, :start_date, :date
    add_column :leases, :end_date, :date
    add_column :leases, :rent_amount, :decimal, precision: 10, scale: 2
    add_column :leases, :security_deposit, :decimal, precision: 10, scale: 2
    add_column :leases, :payment_frequency, :string
    add_reference :leases, :property, null: false, foreign_key: true
    add_reference :leases, :tenant, null: false, foreign_key: true
    add_reference :leases, :landlord, null: false, foreign_key: { to_table: :users }
  end
end
