class Airline < ApplicationRecord
   has_many :flights

   # def passengers
   #    self.joins(flights: :passengers)
   #    .select(
   # end
end