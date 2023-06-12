class AddFlightIdToFlightPassengers < ActiveRecord::Migration[7.0]
  def change
    add_reference :flight_passengers, :flight, foreign_key: true
  end
end
