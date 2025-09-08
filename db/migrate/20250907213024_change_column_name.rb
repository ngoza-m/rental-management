class ChangeColumnName < ActiveRecord::Migration[7.2]
  def change
    rename_column :tenants, :ID, :id_number
  end
end
