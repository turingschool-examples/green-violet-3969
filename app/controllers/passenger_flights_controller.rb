class PassengerFlightsController < ApplicationController

  def destroy 
    passenger_flight = PassengerFlight.find_by(passenger_id: params[:passenger_id], flight_id: params[:flight_id])
    passenger_flight.destroy
    redirect_to flights_path
  end
end