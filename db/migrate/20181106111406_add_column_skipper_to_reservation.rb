class AddColumnSkipperToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :skipper, :string
  end
end
