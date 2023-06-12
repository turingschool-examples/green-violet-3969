class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def destroy
    require 'pry'; binding.pry
    flight = Flight.find(params[:flight_id])
    passenger = flight.passengers.find(params[:passenger_id])
    flight.passengers.delete(passenger)
    redirect_to "/flights"

  end
end