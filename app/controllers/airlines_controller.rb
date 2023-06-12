class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @passengers = Passenger.unique_adults(@airline)
  end
end
