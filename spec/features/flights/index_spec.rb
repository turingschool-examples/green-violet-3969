require "rails_helper"

RSpec.describe "Flights Index Page" do
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
    @passenger_5 = Passenger.create!(name: "Alex", age: 30)


    @pf1 = PassengerFlight.create!(passenger: @passenger_1, flight: @flight_1)
    @pf2 = PassengerFlight.create!(passenger: @passenger_2, flight: @flight_1)
    @pf3 = PassengerFlight.create!(passenger: @passenger_3, flight: @flight_2)
    @pf4 = PassengerFlight.create!(passenger: @passenger_4, flight: @flight_2)
    @pf5 = PassengerFlight.create!(passenger: @passenger_5, flight: @flight_3)
    @pf6 = PassengerFlight.create!(passenger: @passenger_1, flight: @flight_3)
  end

  describe "As a visitor, when I visit the flights index page" do
    it "displays a list of all flight numbers" do
      visit "/flights"

      expect(page).to have_content("Flight Number: #{@flight_1.number}")
      expect(page).to have_content("Flight Number: #{@flight_2.number}")
      expect(page).to have_content("Flight Number: #{@flight_3.number}")
    end

    it "also shows the Airline of that flight next to each number and the names of all the passengers on that flight" do
      visit "/flights"

      within "#flight-#{@flight_1.id}" do
        expect(page).to have_content("Flight Number: #{@flight_1.number}")
        expect(page).to have_content("Airline: #{@sw.name}")
        expect(page).to have_content(@passenger_1.name)
        expect(page).to have_content(@passenger_2.name)
        expect(page).to_not have_content(@passenger_3.name)
      end

      within "#flight-#{@flight_2.id}" do
        expect(page).to have_content("Flight Number: #{@flight_2.number}")
        expect(page).to have_content("Airline: #{@sw.name}")
        expect(page).to have_content(@passenger_3.name)
        expect(page).to have_content(@passenger_4.name)
        expect(page).to_not have_content(@passenger_5.name)
      end
    end

    it "displays a button to remove that passenger from that flight" do
      visit "/flights"

      within "#flight-#{@flight_1.id}"do
       expect(page).to have_button("Remove #{@passenger_1.name}")
      end
    end

    it "allows me to click that button and I no longer see that passenger on that flight but still see the passenger listed under other flights" do
      visit "/flights"

      within "#flight-#{@flight_1.id}" do
        expect(page).to have_content(@passenger_1.name)

        click_button "Remove #{@passenger_1.name}"
        expect(page).to_not have_content(@passenger_1.name)
      end

      expect(current_path).to eq("/flights")
      expect(page).to have_content(@passenger_1.name)
    end
  end
end