class PassengerFlightsController < ApplicationController
  def destroy
    flight = Flight.find(params[:id])
    passenger = Passenger.find(params[:passenger_id])
    flight.passengers.destroy(passenger)
    redirect_to "/flights"
  end
end