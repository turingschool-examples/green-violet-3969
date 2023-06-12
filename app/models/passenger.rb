class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers
  has_many :airlines, through: :flights

  def flight_on(flight)
    self.flight_passengers.where(passenger: self, flight: flight).first
  end
end