class FlightPassengersController < ApplicationController
  def destroy
    @flight_passenger = FlightPassenger.find(params[:id])
    @flight_passenger.destroy
    redirect_to flights_path, notice: "Passenger removed from the flight successfully!"
  end
end