require "rails_helper"

RSpec.describe "/airlines/:id" do
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

  let!(:airline_2) { Airline.create!(name: "No Go Air") }
  let!(:flight_3) { airline_2.flights.create!(number: "789", date:"06/10/2023", departure_city:"DEN", arrival_city: "LGA") }
  let!(:passenger_4) { Passenger.create!(name: "Cant Fly", age: 40) }
  let!(:flight_pass_5) { FlightPassenger.create!(flight: flight_3, passenger: passenger_4) }

  it "displays a list of passengers that is unique / only adults with a flight on this airline" do
    visit "/airlines/#{airline.id}"

    within ".airline_passengers" do
      expect(page).to have_content("#{passenger_1.name}, #{passenger_1.age}")
      expect(page).to have_content("#{passenger_2.name}, #{passenger_2.age}")
      expect(page).to_not have_content("#{passenger_3.name}, #{passenger_3.age}")
      expect(page).to_not have_content("#{passenger_4.name}, #{passenger_4.age}")
    end
  end
end