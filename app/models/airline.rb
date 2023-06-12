class Airline < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :passengers, through: :flights
end
