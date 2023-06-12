class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:airline, :passengers)
  end

  def destroy
    flight = Flight.find(params[:id])
    passenger = Passenger.find(params[:passenger_id])
    flight.passengers.destroy(passenger)
    redirect_to flights_path
  end

end