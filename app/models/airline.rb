class Airline < ApplicationRecord
   has_many :flights
   has_many :passengers, through: :flights

   def uniq_passengers_list
      passengers.where('age >= ?', 18).distinct.order(:name)
   end
end