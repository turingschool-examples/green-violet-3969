require "rails_helper"

RSpec.describe "Flights Index Page" do
  describe "Shows all the flights" do
    it "shows all the flights and their attributes" do
      airline = Airline.create!(name: "Spirit")
    
      flight1 = Flight.create!(number: "1782", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno", airline: airline)
      flight2 = Flight.create!(number: "1234", date: "08/03/20", departure_city: "Jacksonville", arrival_city: "Boulder", airline: airline)

      pass1 = Passenger.create!(name: "Austin", age: 23)
      pass2 = Passenger.create!(name: "Jimmy", age: 23)
      pass3 = Passenger.create!(name: "Garrett", age: 23)
      pass4 = Passenger.create!(name: "Julian", age: 23)

      flight_passenger1 = FlightPassenger.create!(passenger: pass1, flight: flight1)
      flight_passenger2 = FlightPassenger.create!(passenger: pass2, flight: flight1)
      flight_passenger3 = FlightPassenger.create!(passenger: pass3, flight: flight2)
      flight_passenger4 = FlightPassenger.create!(passenger: pass4, flight: flight2)
      
      visit flights_path

      expect(page).to have_content(flight1.number)
      expect(page).to have_content(flight2.number)
      expect(page).to have_content(airline.name)
    end

    it "shows all the passengers for a flight" do
      airline = Airline.create!(name: "Spirit")
    
      flight1 = Flight.create!(number: "1782", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno", airline: airline)
      flight2 = Flight.create!(number: "1234", date: "08/03/20", departure_city: "Jacksonville", arrival_city: "Boulder", airline: airline)

      pass1 = Passenger.create!(name: "Austin", age: 23)
      pass2 = Passenger.create!(name: "Jimmy", age: 23)
      pass3 = Passenger.create!(name: "Garrett", age: 23)
      pass4 = Passenger.create!(name: "Julian", age: 23)

      flight_passenger1 = FlightPassenger.create!(passenger: pass1, flight: flight1)
      flight_passenger2 = FlightPassenger.create!(passenger: pass2, flight: flight1)
      flight_passenger3 = FlightPassenger.create!(passenger: pass3, flight: flight2)
      flight_passenger4 = FlightPassenger.create!(passenger: pass4, flight: flight2)

      visit flights_path
      expect(page).to have_content(pass1.name)
      expect(page).to have_content(pass2.name)
      expect(page).to have_content(pass3.name)
      expect(page).to have_content(pass4.name)
    end

    it "can remove passengers from flight" do
      airline = Airline.create!(name: "Spirit")
    
      flight1 = Flight.create!(number: "1782", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno", airline: airline)
      flight2 = Flight.create!(number: "1234", date: "08/03/20", departure_city: "Jacksonville", arrival_city: "Boulder", airline: airline)

      pass1 = Passenger.create!(name: "Austin", age: 23)
      pass2 = Passenger.create!(name: "Jimmy", age: 23)
      pass3 = Passenger.create!(name: "Garrett", age: 23)
      pass4 = Passenger.create!(name: "Julian", age: 23)

      flight_passenger1 = FlightPassenger.create!(passenger: pass1, flight: flight1)
      flight_passenger2 = FlightPassenger.create!(passenger: pass2, flight: flight1)
      flight_passenger3 = FlightPassenger.create!(passenger: pass3, flight: flight2)
      flight_passenger4 = FlightPassenger.create!(passenger: pass4, flight: flight2)

      visit flights_path
      within("#passenger-#{pass1.id}") do
        expect(page).to have_content(pass1.name)
        click_button "Remove this passenger from the flight"
      end
      expect(page).to_not have_content(pass1.name)
    end
  end
end