class Flight < ApplicationRecord
   belongs_to :airline
   has_many :flight_passengers
   has_many :passengers, through: :flight_passengers

   def remove_from_flight
      flight = Flight.find(params[:flight_id])
      passenger = Passenger.find(params[:id])
      flight.passengers.delete(passenger)
      redirect_to flights_path
   end
end