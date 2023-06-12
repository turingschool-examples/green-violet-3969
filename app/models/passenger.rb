class Passenger < ApplicationRecord
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights


  def self.unique_adults(airline)
    joins(flights: :airline)
      .where('age >= 18 and airlines.id = ?', airline.id)
      .distinct.to_a.uniq { |passenger| passenger.name }
  end
end

  # def self.sorted_by_flight_count(airline)
  #   joins(:flights)
  #     .where(flights: { airline: airline })
  #     .select('passengers.*, COUNT(flights.id) AS flight_count')
  #     .group('passengers.id')
  #     .order('flight_count DESC')
  # end