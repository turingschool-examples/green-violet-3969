require "rails_helper"

RSpec.describe "/airlines/:id" do
  describe "as a visitor" do
    describe "when I visit an airlines show page" do

      let!(:airline_1) { Airline.create!(name: "Delta") }
      let!(:airline_2) { Airline.create!(name: "Southwest") }

      let!(:flight_1) { Flight.create!(number: "FUK666", date: "9/12/84", departure_city: "DEN", arrival_city: "BOS", airline_id: airline_1.id) }
      let!(:flight_2) { Flight.create!(number: "GO324D", date: "9/12/87", departure_city: "DEN", arrival_city: "LAX", airline_id: airline_1.id) }
      let!(:flight_3) { Flight.create!(number: "CRAPSTRT", date: "9/12/20", departure_city: "DEN", arrival_city: "NOL", airline_id: airline_1.id) }

      let!(:flight_4) { Flight.create!(number: "CRA23RT", date: "6/24/20", departure_city: "DEN", arrival_city: "NOL", airline_id: airline_2.id) }
      let!(:flight_5) { Flight.create!(number: "4RA23RT", date: "12/6/20", departure_city: "BOS", arrival_city: "NOL", airline_id: airline_2.id) }


      let!(:pass_1) { Passenger.create!(name: "Joey", age: 37) }
      let!(:pass_2) { Passenger.create!(name: "Ike", age: 12) }
      let!(:pass_3) { Passenger.create!(name: "Sarah", age: 26) }
      let!(:pass_4) { Passenger.create!(name: "Dave", age: 26) }

            # airline 1
      let!(:flight_pass_1) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: pass_1.id ) }
      let!(:flight_pass_2) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: pass_2.id ) }
      let!(:flight_pass_3) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: pass_3.id ) }

      let!(:flight_pass_4) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: pass_2.id ) }
      let!(:flight_pass_5) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: pass_3.id ) }

            # airline 2
      let!(:flight_pass_6) { FlightPassenger.create!(flight_id: flight_4.id, passenger_id: pass_2.id ) }
      let!(:flight_pass_7) { FlightPassenger.create!(flight_id: flight_4.id, passenger_id: pass_3.id ) }
      let!(:flight_pass_8) { FlightPassenger.create!(flight_id: flight_4.id, passenger_id: pass_4.id ) }

      let!(:flight_pass_9) { FlightPassenger.create!(flight_id: flight_5.id, passenger_id: pass_3.id ) }
      let!(:flight_pass_10) { FlightPassenger.create!(flight_id: flight_5.id, passenger_id: pass_4.id ) }

      it "displays a unique list of adult passengers that have flights on the airline" do
        visit airline_path(airline_1)

        expect(page).to have_content(pass_1.name)
        expect(page).to have_content(pass_3.name)

        expect(page).to_not have_content(pass_2.name) #too young
        expect(page).to_not have_content(pass_4.name) #not on airline

        visit airline_path(airline_2)

        expect(page).to have_content(pass_3.name)
        expect(page).to have_content(pass_4.name)

        expect(page).to_not have_content(pass_2.name) # too young
        expect(page).to_not have_content(pass_1.name) # not on airline

      end
    end
  end
end

# User Story 3, Airline's Passengers

# As a visitor
# When I visit an airline's show page
# Then I see a list of passengers that have flights on that airline
# And I see that this list is unique (no duplicate passengers)
# And I see that this list only includes adult passengers.

# (Note: an adult is anyone with age greater than or equal to 18)

