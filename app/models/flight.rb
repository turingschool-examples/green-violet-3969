class Flight < ApplicationRecord
  has_many :passengers, through: :passenger_flights
  belongs_to :airline
end