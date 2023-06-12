class Airline < ApplicationRecord
   has_many :flights
   has_many :passengers, through: :flights

   def adult_passengers
      passengers.joins(:flights)
      .where('passengers.age >= ?', 18)
      .select('passengers.*, COUNT(flights.id) AS flight_count')
      .group('passengers.id')
      .order('flight_count DESC').distinct

      # passengers.joins(:flights).where('passengers.age >= ?', 18).distinct
   end
end