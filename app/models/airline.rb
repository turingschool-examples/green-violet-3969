class Airline < ApplicationRecord
   has_many :flights
   has_many :passenger_flights, through: :flights
   has_many :passengers, through: :passenger_flights

   def frequent_flyers
      passengers.joins(:passenger_flights)
      .select('passengers.id, 
         passengers.name, 
         count(distinct passenger_flights.id) as flight_count')
      .group('passengers.id')
      .where('passengers.age >=18')
      .order('flight_count desc')
   end
end