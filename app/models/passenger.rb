class Passenger < ApplicationRecord
  has_many :passengers_flights
  has_many :flights, through: :passengers_flights
end