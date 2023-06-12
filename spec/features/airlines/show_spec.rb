require "rails_helper"

RSpec.describe "airline show" do
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
    @fp6 = FlightPassenger.create!(flight: @dallas, passenger: @sam)
  
  end

  it "list each adult passenger (18 years OR older) on at least one flight for that airline" do 
    visit airline_path(@sw)

    within(".adult_passengers") do 
      expect(page).to have_content(@abe.name)
      expect(page).to have_content(@bob.name)
      expect(page).to_not have_content(@bill.name)
    end

    visit airline_path(@delta)

    within(".adult_passengers") do 
      expect(page).to have_content(@bill.name)
      expect(page).to_not have_content(@joe.name)
      expect(page).to_not have_content(@jill.name)
    end

    visit airline_path(@spirit)

    within(".adult_passengers") do 
      expect(page).to have_content(@jill.name)
      expect(page).to_not have_content(@sam.name)
      expect(page).to_not have_content(@bill.name)
    end
  end
end