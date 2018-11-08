class RemoveAvaibleFromBoats < ActiveRecord::Migration[5.2]
  def change
    remove_column :boats, :avaible, :boolean
  end
end
