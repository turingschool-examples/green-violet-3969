class RemoveFlightIdFromFlightPassengers < ActiveRecord::Migration[7.0]
  def change
    remove_column :flight_passengers, :flight_id
  end
end
