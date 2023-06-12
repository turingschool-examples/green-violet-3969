class FlightPassengersController < ApplicationController
  def destroy
    FlightPassenger.destroy(params[:flight_passenger])
    redirect_to flights_path
  end
end