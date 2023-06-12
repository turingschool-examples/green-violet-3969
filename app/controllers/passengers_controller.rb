class PassengersController < ApplicationController
  def destroy
    passenger = Passenger.find(params[:id])
    flight = passenger.flights.find(params[:flight_id])
    passenger.flights.delete(flight)

    redirect_to flights_path, notice: "Passenger removed from the flight"
  end
end