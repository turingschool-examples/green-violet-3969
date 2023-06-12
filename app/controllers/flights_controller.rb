class FlightsController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @flights = Flight.all
  end
end