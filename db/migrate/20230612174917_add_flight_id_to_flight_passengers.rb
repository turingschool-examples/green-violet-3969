class AddFlightIdToFlightPassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :flight_passengers do |t|
      t.references :flight, foreign_key: true
      t.references :passenger, foreign_key: true
      t.timestamps
    end
  end
end