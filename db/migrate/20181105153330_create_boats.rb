class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :type
      t.string :city
      t.integer :price
      t.integer :size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
