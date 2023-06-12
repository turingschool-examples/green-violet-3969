require "rails_helper"

RSpec.describe "Airline's Show Page" do
  before(:each) do
    @delta = Airline.create!(name: "Delta")
    @sw = Airline.create!(name: "South West")

    @flight_1 = Flight.create!(number: 2540, date: "08/02/20", departure_city: "Denver", arrival_city: "Reno", airline: @sw)
    @flight_2 = Flight.create!(number: 1232, date: "08/03/20", departure_city: "Denver", arrival_city: "Jackson", airline: @sw)
    @flight_3 = Flight.create!(number: 1232, date: "08/03/20", departure_city: "Denver", arrival_city: "Jackson", airline: @delta)

    @passenger_1 = Passenger.create!(name: "Ben", age: 32)
    @passenger_2 = Passenger.create!(name: "Molly", age: 21)
    @passenger_3 = Passenger.create!(name: "Steve", age: 45)
    @passenger_4 = Passenger.create!(name: "Erin", age: 30)
    @passenger_5 = Passenger.create!(name: "Alex", age: 12)
    @passenger_6 = Passenger.create!(name: "Dan", age:34)



    @pf1 = PassengerFlight.create!(passenger: @passenger_1, flight: @flight_1)
    @pf2 = PassengerFlight.create!(passenger: @passenger_2, flight: @flight_1)
    @pf3 = PassengerFlight.create!(passenger: @passenger_3, flight: @flight_2)
    @pf4 = PassengerFlight.create!(passenger: @passenger_4, flight: @flight_2)
    @pf5 = PassengerFlight.create!(passenger: @passenger_1, flight: @flight_2)
    @pf6 = PassengerFlight.create!(passenger: @passenger_3, flight: @flight_2)
    @pf7 = PassengerFlight.create!(passenger: @passenger_5, flight: @flight_1)
    @pf8 = PassengerFlight.create!(passenger: @passenger_6, flight: @flight_3)

  end

  describe "As a visitor, when I visit an Airline's show page" do
    it "displays a list of passengers that have flights on that airline, uniquley and are older that 18"  do
      visit "/airlines/#{@sw.id}"
      
      expect(page).to have_content(@passenger_1.name, count: 1)
      expect(page).to have_content(@passenger_2.name)
      expect(page).to have_content(@passenger_3.name, count: 1)
      expect(page).to have_content(@passenger_4.name)
      expect(page).to_not have_content(@passenger_5.name)
      expect(page).to_not have_content(@passenger_6.name)
    end
  end
end