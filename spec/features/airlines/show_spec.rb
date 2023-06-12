require "rails_helper"

RSpec.describe "Airline show page" do
  describe "Airline show page" do
    it "shows a unique list of passengers that are adults" do
      airline = Airline.create!(name: "Spirit")
      airline2 = Airline.create!(name: "Delta")
    
      flight1 = Flight.create!(number: "1782", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno", airline: airline)
      flight2 = Flight.create!(number: "23425", date: "08/03/20", departure_city: "Shreveport", arrival_city: "Dallas", airline: airline)
      flight3 = Flight.create!(number: "1234", date: "08/03/20", departure_city: "Jacksonville", arrival_city: "Boulder", airline: airline2)

      pass1 = Passenger.create!(name: "Austin", age: 23)
      pass2 = Passenger.create!(name: "Jimmy", age: 23)
      pass3 = Passenger.create!(name: "Garrett", age: 13)
      pass4 = Passenger.create!(name: "Julian", age: 23)

      flight_passenger1 = FlightPassenger.create!(passenger: pass1, flight: flight1)
      flight_passenger1 = FlightPassenger.create!(passenger: pass1, flight: flight2)
      flight_passenger2 = FlightPassenger.create!(passenger: pass2, flight: flight1)
      flight_passenger3 = FlightPassenger.create!(passenger: pass3, flight: flight1)
      flight_passenger4 = FlightPassenger.create!(passenger: pass4, flight: flight3)

      visit airline_path(airline)
      expect(page).to have_content(pass1.name)
      expect(page).to have_content(pass2.name)
      expect(page).to_not have_content(pass3.name)
      expect(page).to_not have_content(pass4.name)

    end
  end
end