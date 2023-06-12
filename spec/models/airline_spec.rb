require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights)}
  end

  describe "instance methods" do
    before(:each) do
      @sw = Airline.create!(name: "South West")

      @flight_1 = Flight.create!(number: 2540, date: "08/02/20", departure_city: "Denver", arrival_city: "Reno", airline: @sw)
      @flight_2 = Flight.create!(number: 1232, date: "08/03/20", departure_city: "Denver", arrival_city: "Jackson", airline: @sw)

      @passenger_1 = Passenger.create!(name: "Ben", age: 32)
      @passenger_2 = Passenger.create!(name: "Molly", age: 21)
      @passenger_3 = Passenger.create!(name: "Steve", age: 45)
      @passenger_4 = Passenger.create!(name: "Erin", age: 30)
      @passenger_5 = Passenger.create!(name: "Alex", age: 12)


      @pf1 = PassengerFlight.create!(passenger: @passenger_1, flight: @flight_1)
      @pf2 = PassengerFlight.create!(passenger: @passenger_2, flight: @flight_1)
      @pf3 = PassengerFlight.create!(passenger: @passenger_3, flight: @flight_2)
      @pf4 = PassengerFlight.create!(passenger: @passenger_4, flight: @flight_2)
      @pf5 = PassengerFlight.create!(passenger: @passenger_1, flight: @flight_2)
      @pf6 = PassengerFlight.create!(passenger: @passenger_3, flight: @flight_2)
      @pf7 = PassengerFlight.create!(passenger: @passenger_5, flight: @flight_1)

    end
    describe "#passenger_unique_adult"
      it "will show all passengers of that airline uniquely" do
        expect(@sw.passengers_unique_adult).to eq([@passenger_1, @passenger_2, @passenger_3, @passenger_4])
      end
  end
end
