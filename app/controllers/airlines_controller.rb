class AirlinesController < ApplicationController
  def show
  @airline = Airline.find(params[:id])
  # require 'pry'; binding.pry
  end
end