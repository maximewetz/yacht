class AddColumnAvaibleToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :avaible, :boolean, default: true
  end
end
