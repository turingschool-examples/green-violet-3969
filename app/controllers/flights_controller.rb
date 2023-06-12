class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:airline, :passengers)
  end
end