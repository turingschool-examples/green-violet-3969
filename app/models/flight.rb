class Flight < ApplicationRecord
   belongs_to :airline
   has_many :passengers_flights
   has_many :passengers, through: :passengers_flights
end