require "rails_helper"

RSpec.describe "/flights" do
  let!(:airline) { Airline.create!(name: "Buzz Buzz Air") }

  let!(:flight_1) { airline.flights.create!(number: "123", date:"06/01/2023", departure_city:"DEN", arrival_city: "LGA") }
  let!(:flight_2) { airline.flights.create!(number: "456", date:"06/02/2023", departure_city:"LAX", arrival_city: "JFK") }

  let!(:passenger_1) { Passenger.create!(name: "Buddy Boy", age: 55) }
  let!(:passenger_2) { Passenger.create!(name: "Ole Pal", age: 65) }
  let!(:passenger_3) { Passenger.create!(name: "Jet Son", age: 15) }

  let!(:flight_pass_1) { FlightPassenger.create!(flight: flight_1, passenger: passenger_1) }
  let!(:flight_pass_2) { FlightPassenger.create!(flight: flight_1, passenger: passenger_2) }
  let!(:flight_pass_3) { FlightPassenger.create!(flight: flight_2, passenger: passenger_2) }
  let!(:flight_pass_4) { FlightPassenger.create!(flight: flight_2, passenger: passenger_3) }

  it "displays all of the flight numbers and Airline associated with the flight" do
    visit "/flights"

    expect(page).to have_content("Flights")

    within ".flight_#{flight_1.id}" do
      expect(page).to have_content("Flight #: #{flight_1.number}, Airline: #{airline.name}")
    end

    within ".flight_#{flight_2.id}" do
      expect(page).to have_content("Flight #: #{flight_2.number}, Airline: #{airline.name}")
    end
  end

  it "displays the passengers for each flight under the flight number" do
    visit "/flights"

    expect(page).to have_content("Flights")

    within ".flight_#{flight_1.id}" do
      expect(page).to have_content("Flight #: #{flight_1.number}, Airline: #{airline.name}")
      expect(page).to have_content("Passengers:")
      expect(page).to have_content("#{passenger_1.name}")
      expect(page).to have_content("#{passenger_2.name}")
    end

    within ".flight_#{flight_2.id}" do
      expect(page).to have_content("Flight #: #{flight_2.number}, Airline: #{airline.name}")
      expect(page).to have_content("Passengers:")
      expect(page).to have_content("#{passenger_2.name}")
      expect(page).to have_content("#{passenger_3.name}")
      save_and_open_page
    end
  end
end