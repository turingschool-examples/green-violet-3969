class Passenger < ApplicationRecord
  has_many :flights, through: :passenger_flights
end
