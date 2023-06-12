class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def destroy
    @passenger_flight = Flight.find(params[:id])
    @passenger_flight.passenger_flights.find(params[:id])
    @passenger_flight.destroy
    redirect_to "/flights"
  end

end