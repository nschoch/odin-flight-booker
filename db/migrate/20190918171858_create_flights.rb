class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :start_airport_id
      t.integer :finish_airport_id
      t.datetime :date
      t.float :duration
      t.integer :seats_available

      t.timestamps
    end
  end
end
