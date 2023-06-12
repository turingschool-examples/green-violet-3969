class FlightPassengersController < ApplicationController
  def destroy
    flight_passenger = FlightPassenger.find_by(passenger_id: params[:id], flight_id: params[:flight])
    FlightPassenger.destroy(flight_passenger.id)
    redirect_to "/flights"
  end
end