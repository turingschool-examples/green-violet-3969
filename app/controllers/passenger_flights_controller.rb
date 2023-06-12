class PassengerFlightsController < ApplicationController

  def destroy 
    passenger_flight = PassengerFlight.find_by(passenger_id: params[:passenger_id], flight_id: params[:flight_id])
    passenger_flight.destroy
    redirect_to flights_path
  end

  private

  def p_flight_params
    params.permit(:passenger_id, :flight_id)
  end
end