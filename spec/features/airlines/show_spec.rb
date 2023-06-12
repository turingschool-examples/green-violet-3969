require "rails_helper"

RSpec.describe "/airlines/:id, airlines show page", type: :feature do
  let!(:frontier) { Airline.create!(name: "Frontier") }
  let!(:flight1) { frontier.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")}
  let!(:flight2) { frontier.flights.create!(number: "1370", date: "08/07/20", departure_city: "Reno", arrival_city: "San Francisco") }

  let!(:southwest) { Airline.create!(name: "Southwest") }
  let!(:flight3) { southwest.flights.create!(number: "2799", date: "07/31/20", departure_city: "San Francisco", arrival_city: "Reno") }

  let!(:passenger1) { Passenger.create!(name: "Joe", age: 7) }
  let!(:passenger2) { Passenger.create!(name: "Michael", age: 32) }
  let!(:passenger3) { Passenger.create!(name: "Ashley", age: 27) }
  let!(:passenger4) { Passenger.create!(name: "Taylor", age: 18) }
  let!(:passenger5) { Passenger.create!(name: "Bella", age: 17) }

  let!(:fp1) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id) }
  let!(:fp2) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger2.id) }
  let!(:fp3) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger3.id) }
  let!(:fp4) { FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger3.id) }
  let!(:fp5) { FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger4.id) }
  let!(:fp6) { FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger4.id) }
  let!(:fp7) { FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger5.id) }

  describe "as a visitor on the airlines show page" do
    it "displays all (distinct) adult passengers with flights on that airline" do
      visit "/airlines/#{frontier.id}"

      expect(page).to have_content(frontier.name)
      expect(page).to have_content("All Adult Passengers:")
      expect(page).to have_content(passenger2.name, count: 1)
      expect(page).to have_content(passenger3.name, count: 1)
      expect(page).to_not have_content(passenger1.name)
      expect(page).to_not have_content(southwest.name)
      expect(page).to_not have_content(passenger5.name)

      visit "/airlines/#{southwest.id}"
      expect(page).to have_content(southwest.name)
      expect(page).to have_content(passenger4.name, count: 1)
      expect(page).to_not have_content(passenger5.name)
    end
  end
end