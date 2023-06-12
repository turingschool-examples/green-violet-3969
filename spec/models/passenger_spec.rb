require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it {should have_many(:flight_passengers)}
    it {should have_many(:flights).through(:flight_passengers)}
    it {should have_many(:airlines).through(:flights)}
  end
  describe "instance methods" do
    it "flight_on" do
      airline = Airline.create!(name: "Spirit")
    
      flight1 = Flight.create!(number: "1782", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno", airline: airline)
      flight2 = Flight.create!(number: "1234", date: "08/03/20", departure_city: "Jacksonville", arrival_city: "Boulder", airline: airline)

      pass1 = Passenger.create!(name: "Austin", age: 23)
      pass2 = Passenger.create!(name: "Jimmy", age: 23)
      pass3 = Passenger.create!(name: "Garrett", age: 23)
      pass4 = Passenger.create!(name: "Julian", age: 23)

      flight_passenger1 = FlightPassenger.create!(passenger: pass1, flight: flight1)
      flight_passenger2 = FlightPassenger.create!(passenger: pass2, flight: flight1)
      flight_passenger3 = FlightPassenger.create!(passenger: pass3, flight: flight2)
      flight_passenger4 = FlightPassenger.create!(passenger: pass4, flight: flight2)

      expect(pass1.flight_on(flight1)).to eq(flight_passenger1)
    end
  end
end