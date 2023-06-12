class Airline < ApplicationRecord
   has_many :flights

   def current_passengers
      require 'pry'; binding.pry
   end

end