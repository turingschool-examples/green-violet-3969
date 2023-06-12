class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def destroy
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:passenger_id])
    flight.passengers.delete(passenger)
    redirect_to "/flights"
  end
end