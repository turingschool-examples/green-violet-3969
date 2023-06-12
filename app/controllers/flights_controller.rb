class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def destroy
    @flight = Flight.find(params[:id])
    passenger_flights = @flight.passenger_flights.all
    passenger = passenger_flights.find(:id)
    passenger.destroy
    redirect_to "/flights"
  end

end