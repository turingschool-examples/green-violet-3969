class Passenger < ApplicationRecord
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights


  def self.unique_adults(airline)
    joins(:flights).where(flights: { airline: airline }, age: 18..1000).distinct
  end

end