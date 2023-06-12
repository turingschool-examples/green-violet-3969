class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.find_passenger_to_delete(flight, passenger)
    where("flight_id = #{flight} AND passenger_id = #{passenger}").first
  end
end