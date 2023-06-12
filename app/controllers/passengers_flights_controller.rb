class PassengersFlightsController < ApplicationController
  def destroy
    passenger_flights = PassengersFlight.find(params[:id])
    passenger_flights.destroy
    redirect_to flights_path
  end
end