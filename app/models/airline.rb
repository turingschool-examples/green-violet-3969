class Airline < ApplicationRecord
   has_many :flights

   def current_passengers

      x = flights.joins(:passengers)
      .distinct
      .where("passengers.age >= ?", 18)
      .pluck(:name)

      # .select(:name)
      # .select("passengers.*")
# this returns the name only...should we have returned the object and then selected the name in the view?
   end

end