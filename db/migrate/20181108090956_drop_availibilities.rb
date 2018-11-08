class DropAvailibilities < ActiveRecord::Migration[5.2]
  def change
    drop_table :availibilities
  end
end
