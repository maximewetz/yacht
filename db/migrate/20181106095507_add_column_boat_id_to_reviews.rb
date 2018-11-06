class AddColumnBoatIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :boat_id, :bigint
  end
end
