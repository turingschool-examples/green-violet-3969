require "rails_helper"

RSpec.describe FlightPassenger, type: :model do
  describe "relationships" do
    it { should belong_to :flight }
    it { should belong_to :passenger }
  end

  describe "class methods" do
    before(:each) do
      @airline_1 = Airline.create!(name: "Frontier")
      @airline_2 = Airline.create!(name: "Delta")

      @frontier_flight_1 = @airline_1.flights.create!(flight_number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")

      @delta_flight_1 = @airline_2.flights.create!(flight_number: "1154", date: "08/03/20", departure_city: "Denver", arrival_city: "Tokyo")

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
    end

    context "::find_passenger_to_delete" do
      it "finds the passenger to delete" do
        expect(FlightPassenger.find_passenger_to_delete(@frontier_flight_1.id, @passenger_1.id)).to eq(@fp_1)
      end
    end
  end
end