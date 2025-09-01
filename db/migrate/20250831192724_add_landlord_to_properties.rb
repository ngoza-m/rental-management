class AddLandlordToProperties < ActiveRecord::Migration[7.2]
  def change
    add_column :properties, :landlord, :string
  end
end
