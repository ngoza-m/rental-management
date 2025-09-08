class CreateLeases < ActiveRecord::Migration[7.2]
  def change
    create_table :leases do |t|
      t.timestamps
    end
  end
end
