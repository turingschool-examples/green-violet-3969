class AirlinesController < ApplicationController
  def show 
    # require 'pry'; binding.pry
    @airline = Airline.find(params[:id])

  end
end