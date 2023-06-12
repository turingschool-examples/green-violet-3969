class FlightsController < ApplicationController

  def index
    @flights = Flight.all
    # @passenger = Passenger.
    require 'pry'; binding.pry
  end
end
