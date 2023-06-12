class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @passengers = @airline.passengers.distinct.where('age >= ?', 18)
  end
end

