class PassengerFlightsController < ApplicationController
  def destroy
    flight = Flight.find(params[:flight_id])
    flight.passengers.destroy(params[:passenger_id])
    redirect_to "/flights"
  end
end