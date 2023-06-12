require "rails_helper"

RSpec.describe "Airline's Show Page" do
  before(:each) do
    @airline_1 = Airline.create!(name: "Southwest")
    @airline_2 = Airline.create!(name: "Delta")

    @flight_1 = @airline_1.flights.create!(number: "123", date: "01/01/23", departure_city: "Denver", arrival_city: "Las Vegas")
    @flight_2 = @airline_1.flights.create!(number: "456", date: "01/05/23", departure_city: "Denver", arrival_city: "St Louis")
    @flight_3 = @airline_2.flights.create!(number: "789", date: "01/02/23", departure_city: "Chicago", arrival_city: "New York")
    @flight_4 = @airline_2.flights.create!(number: "101", date: "01/02/23", departure_city: "Reno", arrival_city: "New York")

    @passenger_1 = Passenger.create!(name: "Michael", age: 9) 
    @passenger_2 = Passenger.create!(name: "Meg", age: 17)
    @passenger_3 = Passenger.create!(name: "Hector", age: 29)
    @passenger_4 = Passenger.create!(name: "Linda", age: 39)
    @passenger_5 = Passenger.create!(name: "Sally", age: 81)
    @passenger_6 = Passenger.create!(name: "Bob", age: 18)
    @passenger_7 = Passenger.create!(name: "Sue", age: 42)

    @fp_1 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_1) # minor
    @fp_2 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_2) # minor
    @fp_3 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_3)
    @fp_9 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_6)
    @fp_4 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_4)
    @fp_5 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_1) # minor
    @fp_6 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_5)
    @fp_7 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_6) # duplicate

    @fp_8 = FlightPassenger.create!(flight: @flight_3, passenger: @passenger_7)
    @fp_10 = FlightPassenger.create!(flight: @flight_4, passenger: @passenger_7) # duplicate
    @fp_11 = FlightPassenger.create!(flight: @flight_4, passenger: @passenger_2) # minor
    @fp_12 = FlightPassenger.create!(flight: @flight_4, passenger: @passenger_6) 
  end

  it "displays a list of unique adult (age 18+) passengers that have flights on that airline" do
    visit airline_path(@airline_1)

    expect(page).to have_content(@passenger_3.name)
    expect(page).to have_content(@passenger_4.name)
    expect(page).to have_content(@passenger_5.name)
    expect(page).to have_content(@passenger_6.name, count: 1) # on two flights (only appear once on list)
    expect(page).to_not have_content(@passenger_1.name) # minor
    expect(page).to_not have_content(@passenger_2.name) # minor
    expect(page).to_not have_content(@passenger_7.name) # different airline

    visit airline_path(@airline_2)

    expect(page).to have_content(@passenger_6.name)
    expect(page).to have_content(@passenger_7.name, count: 1) # on two flights (only appear once on list)
    expect(page).to_not have_content(@passenger_2.name) # minor
  end
end