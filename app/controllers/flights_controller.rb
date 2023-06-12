class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def destroy
    @flight = Flight.find(params[:id])
    passenger_flight = @flight.passenger_flights.find(params[:passenger_id])
    passenger_flight.destroy
    redirect_to "/flights"
  end

end