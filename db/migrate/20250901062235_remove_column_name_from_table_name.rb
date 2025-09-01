class RemoveColumnNameFromTableName < ActiveRecord::Migration[7.2]
  def change
    remove_column :properties, :landlord, :string
  end
end
