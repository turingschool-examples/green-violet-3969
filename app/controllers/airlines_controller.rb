class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @passengers = Passenger.unique_adults_for_airline(@airline)
  end
end
