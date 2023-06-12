class FlightsController < ApplicationController

  def index
    @flight = Flight.

  end

  # private
  # def flight_params
  #   params.permit(:flight, :id, :number, :date, :departure_city, :arrival_city)
  # end
end