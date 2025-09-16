class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.references :lease, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true
      t.integer :amount
      t.date :paid_at
      t.integer :status
      t.string :transaction_id

      t.timestamps
    end
  end
end
