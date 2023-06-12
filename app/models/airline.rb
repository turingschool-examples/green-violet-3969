class Airline < ApplicationRecord
   has_many :flights
   has_many :passengers, through: :flights

   def adult_passengers_distinct
      passengers.where("passengers.age >= 18").distinct
   end
end