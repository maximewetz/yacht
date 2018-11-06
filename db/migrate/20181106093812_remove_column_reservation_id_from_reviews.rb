class RemoveColumnReservationIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :reservation_id
  end
end
