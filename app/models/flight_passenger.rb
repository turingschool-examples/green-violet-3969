class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.remove_passenger(flight, passenger)
    find_by(flight: flight, passenger: passenger)&.destroy
  end
end
