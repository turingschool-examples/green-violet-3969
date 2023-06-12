class Airline < ApplicationRecord
   has_many :flights
   has_many :passenger_flights, through: :flights
   has_many :passengers, through: :passenger_flights

   def unique_adults
      passengers.where('age > 18').distinct
      
   end
end

