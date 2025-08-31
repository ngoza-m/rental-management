class AddColumnToProperties < ActiveRecord::Migration[7.2]
  def change
    add_column :properties, :rent, :integer
    add_column :properties, :description, :text
  end
end
