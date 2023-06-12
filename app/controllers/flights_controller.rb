class FlightsController < ApplicationController
  def index
    @flights = Flight.joins(:airline, :passengers).distinct
  end
end
