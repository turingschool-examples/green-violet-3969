require "rails_helper"

RSpec.describe "airline show page", type: :feature do
  describe "user story 3" do
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

      FlightPassenger.create!(flight_id: @frontier_flight_1.id, passenger_id: @passenger_1.id)
      FlightPassenger.create!(flight_id: @frontier_flight_1.id, passenger_id: @passenger_2.id)

      FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_1.id)
      FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_2.id)
      FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_3.id)
      FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_4.id)
      FlightPassenger.create!(flight_id: @delta_flight_1.id, passenger_id: @passenger_5.id)
    end

    context "airline_1" do
      it "displays a unique list of adult passenger that have flights on that airline" do
        visit airline_path(@airline_1)

        expect(page).to have_content(@passenger_1.name)
        expect(page).to have_content(@passenger_2.name)
        expect(page).to_not have_content(@passenger_3.name)
        expect(page).to_not have_content(@passenger_4.name)
      end
    end

    context "airline_2" do
      it "displays a unique list of adult passenger that have flights on that airline" do
        visit airline_path(@airline_2)

        expect(page).to have_content(@passenger_1.name)
        expect(page).to have_content(@passenger_2.name)
        expect(page).to have_content(@passenger_3.name)
        expect(page).to have_content(@passenger_4.name)
      end
    end
  end
end
