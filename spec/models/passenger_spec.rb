require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it {should have_many :flights}
  end
  before(:each) do
    @airline_1 = Airline.create!(name: "BlueJet")
    @airline_2 = Airline.create!(name: "Atled")
    @flight_1 = @airline_1.flights.create!(number: 1234, date: "07/03/23", departure_city: "LA", arrival_city: "Reno")
    @flight_2 = @airline_2.flights.create!(number: 1254, date: "07/03/23", departure_city: "SF", arrival_city: "Seatle")
    @passenger_1 = @flight_1.passengers.create!(name: "Bob", age: 12)
    @passenger_2 = @flight_1.passengers.create!(name: "Bill", age: 18)
    @passenger_3 = @flight_1.passengers.create!(name: "Joe", age: 40)
    @passenger_4 = @flight_1.passengers.create!(name: "Frank", age: 60)
    @passenger_5 = @flight_2.passengers.create!(name: "George", age: 23)
    @passenger_6 = @flight_2.passengers.create!(name: "Jake", age: 32)
    @passenger_7 = @flight_2.passengers.create!(name: "Aaron", age: 45)
    @passenger_8 = @flight_2.passengers.create!(name: "Derek", age: 50)
    @passenger_1 = @flight_2.passengers.create!(name: "Bob", age: 12)
  end
  describe "class methods" do
    it "adult?" do
      expect(Passenger.adult?).to match_array([@passenger_2, @passenger_3, @passenger_4, @passenger_5, @passenger_6, @passenger_7, @passenger_8])
    end
  end
end
