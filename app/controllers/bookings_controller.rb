class BookingsController < ApplicationController
  def destroy
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.where(passenger_id: params[:passenger_id], flight_id: params[:flight_id])
    @booking[0].destroy
    redirect_to "/flights"
  end
end