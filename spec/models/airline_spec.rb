require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it {should have_many :flights}
    it {should have_many(:passengers).through(:flights)}
  end

  before :each do
    @sw = Airline.create!(name: "Southwest")
    @delta = Airline.create!(name: "Delta")
    @spirit = Airline.create!(name: "Spirit")

    @denver = @sw.flights.create!(number: "100", date: "06/13/23", departure_city: "Houston", arrival_city: "Denver")
    @houston = @sw.flights.create!(number: "200", date: "06/14/23", departure_city: "Denver", arrival_city: "Houston")
    @chicago = @delta.flights.create!(number: "300", date: "06/15/23", departure_city: "New York", arrival_city: "Chicago")
    @new_york = @delta.flights.create!(number: "400", date: "06/16/23", departure_city: "Chicago", arrival_city: "New York")
    @toronto = @spirit.flights.create!(number: "500", date: "06/17/23", departure_city: "Toronto", arrival_city: "Dallas")
    @dallas = @spirit.flights.create!(number: "600", date: "06/18/23", departure_city: "Dallas", arrival_city: "Toronto")

    @abe = Passenger.create!(name: "Abe", age: 18)
    @bob = Passenger.create!(name: "Bob", age: 50)
    @bill = Passenger.create!(name: "Bill", age: 18)
    @joe = Passenger.create!(name: "Joe", age: 15)
    @jill = Passenger.create!(name: "Jill", age: 30)
    @sam = Passenger.create!(name: "Sam", age: 10)


    @fp1 = FlightPassenger.create!(flight: @denver, passenger: @abe)
    @fp2 = FlightPassenger.create!(flight: @houston, passenger: @bob)
    @fp3 = FlightPassenger.create!(flight: @chicago, passenger: @bill)
    @fp4 = FlightPassenger.create!(flight: @new_york, passenger: @joe)
    @fp5 = FlightPassenger.create!(flight: @toronto, passenger: @jill)
    @fp7 = FlightPassenger.create!(flight: @dallas, passenger: @sam)
    @fp8 = FlightPassenger.create!(flight: @dallas, passenger: @abe)
    @fp9 = FlightPassenger.create!(flight: @dallas, passenger: @bob)
    @fp10 = FlightPassenger.create!(flight: @dallas, passenger: @bill)
    @fp11 = FlightPassenger.create!(flight: @dallas, passenger: @joe)
  end

  describe "instance methods" do 
    describe "#list_adult_passengers" do 
      it "returns a list of adult passengers who are or over the age of 18 on at least one flight for that airline" do 
        expect(@sw.list_adult_passengers).to eq([@abe.name, @bob.name])
        expect(@sw.passengers.count).to eq(2)
        expect(@sw.list_adult_passengers.count).to eq(2)

        expect(@delta.list_adult_passengers).to eq([@bill.name])
        expect(@delta.passengers.count).to eq(2)
        expect(@delta.list_adult_passengers.count).to eq(1)

        expect(@spirit.list_adult_passengers).to eq([@abe.name, @bill.name, @bob.name, @jill.name])
        expect(@spirit.passengers.count).to eq(6)
        expect(@spirit.list_adult_passengers.count).to eq(4)
      end
    end
  end


end


