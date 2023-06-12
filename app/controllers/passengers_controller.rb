class PassengersController < ApplicationController
  def destroy
    passenger = Passenger.find(params[:id])
    flight = Flight.find(params[:flight_id])
    FlightPassenger.where(passenger_id: passenger.id, flight_id: flight.id).destroy_all
    redirect_to flights_path
  end
end