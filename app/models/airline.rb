class Airline < ApplicationRecord
   has_many :flights
   has_many :passengers_flights, through: :flights
   has_many :passengers, through: :passengers_flights
end