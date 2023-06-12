class Airline < ApplicationRecord
   has_many :flights
   has_many :passenger_flights, through: :flights
   has_many :passengers, through: :passenger_flights

   def passenger_names
      passengers.where('passengers.age > 17').distinct.pluck(:name)
   end
end