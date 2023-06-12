require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe "instance methods" do
    let!(:frontier) { Airline.create!(name: "Frontier") }
    let!(:flight1) { frontier.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")}
    let!(:flight2) { frontier.flights.create!(number: "1370", date: "08/07/20", departure_city: "Reno", arrival_city: "San Francisco") }

    let!(:southwest) { Airline.create!(name: "Southwest") }
    let!(:flight3) { southwest.flights.create!(number: "2799", date: "07/31/20", departure_city: "San Francisco", arrival_city: "Reno") }

    let!(:kidsfly) { Airline.create!(name: "KidsFly") }
    let!(:flight4) { kidsfly.flights.create!(number: "1234", date: "01/01/21", departure_city: "Grand Forks", arrival_city: "Orlando") }

    let!(:passenger1) { Passenger.create!(name: "Joe", age: 7) }
    let!(:passenger2) { Passenger.create!(name: "Michael", age: 32) }
    let!(:passenger3) { Passenger.create!(name: "Ashley", age: 27) }
    let!(:passenger4) { Passenger.create!(name: "Taylor", age: 18) }
    let!(:passenger5) { Passenger.create!(name: "Bella", age: 17) }

    let!(:fp1) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id) }
    let!(:fp2) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger2.id) }
    let!(:fp3) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger3.id) }
    let!(:fp4) { FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger3.id) }
    let!(:fp5) { FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger4.id) }
    let!(:fp6) { FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger4.id) }
    let!(:fp7) { FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger5.id) }
    let!(:fp8) { FlightPassenger.create!(flight_id: flight4.id, passenger_id: passenger5.id) }
    let!(:fp9) { FlightPassenger.create!(flight_id: flight4.id, passenger_id: passenger1.id) }

    describe "#adult_passengers" do
      it "returns a distinct list of all adult passengers >= 18 with flights on that airline" do
        expect(frontier.adult_passengers_distinct).to eq([passenger2, passenger3, passenger4])
        expect(frontier.adult_passengers_distinct).to_not eq([passenger2, passenger3, passenger3, passenger4])
        expect(frontier.adult_passengers_distinct).to_not eq([passenger1, passenger2, passenger3, passenger3, passenger4])

        expect(southwest.adult_passengers_distinct).to eq([passenger4])
        expect(southwest.adult_passengers_distinct).to_not eq([passenger4, passenger5])

        expect(kidsfly.adult_passengers_distinct).to eq([])
      end
    end
  end
end
