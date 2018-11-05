class CreateAvailibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availibilities do |t|
      t.date :available_from
      t.date :available_to
      t.references :boat, foreign_key: true

      t.timestamps
    end
  end
end
