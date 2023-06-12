require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many(:flights) }
    it { should have_many(:passengers).through(:flights) }
  end

  describe "instance methods" do
    let!(:airline_1) { Airline.create!(name: "American") }
    let!(:airline_2) { Airline.create!(name: "United") }

    let!(:flight_1) { airline_1.flights.create!(number: "123", date: "06/12/23", departure_city: "San Diego", arrival_city: "Portland") }
    let!(:flight_2) { airline_1.flights.create!(number: "456", date: "06/12/23", departure_city: "Portland", arrival_city: "Seattle") }
    let!(:flight_3) { airline_2.flights.create!(number: "789", date: "06/12/23", departure_city: "Denver", arrival_city: "Durango") }

    let!(:passenger_1) { Passenger.create!(name: "Bob", age: 42) }
    let!(:passenger_2) { Passenger.create!(name: "Sally", age: 25) }
    let!(:passenger_3) { Passenger.create!(name: "Johnny", age: 12) }
    let!(:passenger_4) { Passenger.create!(name: "Susie", age: 8) }
    let!(:passenger_5) { Passenger.create!(name: "Mark", age: 35) }



    before(:each) do
      FlightPassenger.create!(flight: flight_1, passenger: passenger_1)
      FlightPassenger.create!(flight: flight_1, passenger: passenger_3)

      FlightPassenger.create!(flight: flight_2, passenger: passenger_2)
      FlightPassenger.create!(flight: flight_2, passenger: passenger_3)

      FlightPassenger.create!(flight: flight_3, passenger: passenger_4)
      FlightPassenger.create!(flight: flight_3, passenger: passenger_5)
    end

    describe "#adult_passengers" do
      it "returns all adult passengers for the airline" do
        expect(airline_1.adult_passengers).to eq([passenger_1, passenger_2])
        expect(airline_2.adult_passengers).to eq([passenger_5])
      end
    end
  end
end
