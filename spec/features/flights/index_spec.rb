require "rails_helper"

RSpec.describe "the flights index page" do
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
    FlightPassenger.create!(flight: flight_1, passenger: passenger_2)
    FlightPassenger.create!(flight: flight_1, passenger: passenger_3)

    FlightPassenger.create!(flight: flight_2, passenger: passenger_1)
    FlightPassenger.create!(flight: flight_2, passenger: passenger_3)

    FlightPassenger.create!(flight: flight_3, passenger: passenger_4)
    FlightPassenger.create!(flight: flight_3, passenger: passenger_5)

    visit flights_path
  end

  it "displays all flight numbers and thier associated airline and passengers" do
    within("#page-title") do
      expect(page).to have_content("Flights")
    end

    within("#flight-#{flight_1.id}") do
      expect(page).to have_content("#{flight_1.number} - #{flight_1.airline.name}")
      expect(page).to have_content("Passengers:")

      within("#passenger-#{passenger_1.id}") do
        expect(page).to have_content(passenger_1.name)
      end

      within("#passenger-#{passenger_2.id}") do
        expect(page).to have_content(passenger_2.name)
      end
    end
  end
end
