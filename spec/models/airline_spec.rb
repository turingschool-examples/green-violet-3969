require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many :flights }
    it { should have_many(:flight_passengers).through(:flights) }
    it { should have_many(:passengers).through(:flight_passengers) }
  end

  describe "instance methods" do
    before(:each) do
      @airline_1 = Airline.create!(name: "Frontier")
      @airline_2 = Airline.create!(name: "Delta")

      @frontier_flight_1 = @airline_1.flights.create!(flight_number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")

      @delta_flight_1 = @airline_2.flights.create!(flight_number: "1154", date: "08/03/20", departure_city: "Denver", arrival_city: "Tokyo")
      @delta_flight_2 = @airline_2.flights.create!(flight_number: "1154", date: "08/03/20", departure_city: "Denver", arrival_city: "London")

      @passenger_1 = Passenger.create!(name: "Garrett", age: 36)
      @passenger_2 = Passenger.create!(name: "Audrey", age: 33)
      @passenger_3 = Passenger.create!(name: "Chris", age: 48)
      @passenger_4 = Passenger.create!(name: "Angie", age: 39)
      @passenger_5 = Passenger.create!(name: "Luca", age: 1)

      @fp_1 = FlightPassenger.create!(flight_id: @frontier_flight_1.id, passenger_id: @passenger_1.id)
      @fp_2 = FlightPassenger.create!(flight_id: @frontier_flight_1.id, passenger_id: @passenger_2.id)

      @fp_3 = FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_1.id)
      @fp_4 = FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_2.id)
      @fp_5 = FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_3.id)
      @fp_6 = FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_4.id)
      @fp_7 = FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_5.id)

      @fp_8 = FlightPassenger.create!(flight_id: @delta_flight_2.id, passenger_id: @passenger_1.id)
      @fp_9 = FlightPassenger.create!(flight_id: @delta_flight_2.id, passenger_id: @passenger_2.id)
      @fp_10 = FlightPassenger.create!(flight_id: @delta_flight_2.id, passenger_id: @passenger_3.id)
      @fp_11 = FlightPassenger.create!(flight_id: @delta_flight_2.id, passenger_id: @passenger_4.id)
      @fp_12 = FlightPassenger.create!(flight_id: @delta_flight_2.id, passenger_id: @passenger_5.id)
    end

    context "#unique_adult_passengers" do
      it "finds a list of the unique adult passengers for the airline" do
        expect(@airline_1.unique_adult_passengers).to eq([@passenger_1, @passenger_2])
        expect(@airline_2.unique_adult_passengers).to eq([@passenger_1, @passenger_2, @passenger_3, @passenger_4])
      end
    end
  end
end
