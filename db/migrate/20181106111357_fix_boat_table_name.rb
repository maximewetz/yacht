class FixBoatTableName < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :type, :boat_type
  end
end
