class PassengersController < ApplicationController
  def destroy
    pas_flight = PassengerFlight.find_by(passenger_id: params[:id], flight_id: params[:flight_id])
    pas_flight.destroy
    redirect_to flights_path
  end
end