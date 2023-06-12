class Airline < ApplicationRecord
   has_many :flights
   has_many :passengers, through: :flights

   def passengers_unique_adult
      passengers.distinct.where("age >= 18")
   end
end