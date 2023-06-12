require "rails_helper"

RSpec.describe "/flights, flights index page", type: :feature do
  let!(:frontier) { Airline.create!(name: "Frontier") }
  let!(:flight1) { frontier.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")}
  let!(:flight2) { frontier.flights.create!(number: "1370", date: "08/07/20", departure_city: "Reno", arrival_city: "San Francisco") }

  let!(:southwest) { Airline.create!(name: "Southwest") }
  let!(:flight3) { southwest.flights.create!(number: "2799", date: "07/31/20", departure_city: "San Francisco", arrival_city: "Reno") }

  let!(:passenger1) { Passenger.create!(name: "Joe", age: 7) }
  let!(:passenger2) { Passenger.create!(name: "Michael", age: 32) }
  let!(:passenger3) { Passenger.create!(name: "Ashley", age: 27) }
  let!(:passenger4) { Passenger.create!(name: "Taylor", age: 18) }

  let!(:fp1) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id) }
  let!(:fp2) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger2.id) }
  let!(:fp3) { FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger3.id) }
  let!(:fp4) { FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger3.id) }
  let!(:fp5) { FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger4.id) }
  let!(:fp6) { FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger4.id) }

  describe "as a visitor on flights index page" do
    #userstory 1
    it "shows all flight numbers, name of the airlie for that flight" do
      visit "/flights"

      expect(page).to have_content("All Flights")

      within "#flight-#{flight1.id}" do
        expect(page).to have_content("Flight Number: #{flight1.number} - #{frontier.name}")
      end

      within "#flight-#{flight2.id}" do
        expect(page).to have_content("Flight Number: #{flight2.number} - #{frontier.name}")
      end
      
      within "#flight-#{flight3.id}" do
        expect(page).to have_content("Flight Number: #{flight3.number} - #{southwest.name}")
      end
    end

    it "shows the names of all passengers on that flight under the flight number" do
      visit "/flights"

      within "#flight-#{flight1.id}" do
        expect(page).to have_content("Flight Number: #{flight1.number} - #{frontier.name}")
        expect(page).to have_content("Passengers:")
        expect(page).to have_content(passenger1.name)
        expect(page).to have_content(passenger2.name)
        expect(page).to have_content(passenger3.name)
        expect(page).to_not have_content(passenger4.name)
      end

      within "#flight-#{flight2.id}" do
        expect(page).to have_content("Flight Number: #{flight2.number} - #{frontier.name}")
        expect(page).to_not have_content(passenger1.name)
        expect(page).to_not have_content(passenger2.name)
        expect(page).to have_content(passenger3.name)
        expect(page).to have_content(passenger4.name)
      end

      within "#flight-#{flight3.id}" do
        expect(page).to have_content("Flight Number: #{flight3.number} - #{southwest.name}")
        expect(page).to_not have_content(passenger1.name)
        expect(page).to_not have_content(passenger2.name)
        expect(page).to_not have_content(passenger3.name)
        expect(page).to have_content(passenger4.name)
      end
    end
  end
end