class UpdateFlightPassengersForeignKey < ActiveRecord::Migration[7.0]
  def change
    rename_column :flight_passengers, :airline_id, :flight_id
  end
end
