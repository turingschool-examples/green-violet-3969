class Airline < ApplicationRecord
   has_many :flights

   def current_passengers
      x = flights.joins(:passengers)
      .select(:name)
      .distinct

   end

end