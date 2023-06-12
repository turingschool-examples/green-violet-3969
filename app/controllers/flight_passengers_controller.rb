class FlightPassengersController < ApplicationController
  def destroy
    flightpassenger = FlightPassenger.find_by(flight_id: params[:flight_id], passenger_id: params[:passenger_id])
    flightpassenger.destroy
    redirect_to "/flights"
  end
end