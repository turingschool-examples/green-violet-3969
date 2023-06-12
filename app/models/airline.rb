class Airline < ApplicationRecord
   has_many :flights
   has_many :passenger_flights, through: :flights
   has_many :passengers, through: :passenger_flights

   # def passenger_names
   #    passengers.where('passengers.age >= 18').distinct.pluck(:name)
   # end

   def frequent_flyers
      passengers.joins(:passenger_flights)
      .select('passengers.id, 
         passengers.name, 
         count(passenger_flights.id) as flights')
      .group('passengers.id')
      .where('passengers.age >=18')
      .order('flights desc')
   end
end