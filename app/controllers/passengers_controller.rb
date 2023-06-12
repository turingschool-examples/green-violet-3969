class PassengersController < ApplicationController
  def destroy
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])
    passenger_flight = FlightPassenger.find_passenger_to_delete(flight.id, passenger.id)
    FlightPassenger.destroy(passenger_flight.id)
    redirect_to flights_path
  end
end