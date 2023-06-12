require "rails_helper"

RSpec.describe "/flights" do
  describe "as a visitor" do
    describe "when I visit a flights index page" do

      let!(:airline_1) { Airline.create!(name: "Delta") }
      let!(:flight_1) { Flight.create!(number: "FUK666", date: "9/12/84", departure_city: "DEN", arrival_city: "BOS", airline_id: airline_1.id) }
      let!(:flight_2) { Flight.create!(number: "GO324D", date: "9/12/87", departure_city: "DEN", arrival_city: "LAX", airline_id: airline_1.id) }
      let!(:flight_3) { Flight.create!(number: "CRAPSTRT", date: "9/12/20", departure_city: "DEN", arrival_city: "NOL", airline_id: airline_1.id) }

      let!(:pass_1) { Passenger.create!(name: "Joey", age: 37) }
      let!(:pass_2) { Passenger.create!(name: "Ike", age: 12) }
      let!(:pass_3) { Passenger.create!(name: "Sarah", age: 26) }
      let!(:pass_4) { Passenger.create!(name: "Dave", age: 26) }

      let!(:flight_pass_1) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: pass_1.id ) }
      let!(:flight_pass_2) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: pass_2.id ) }
      let!(:flight_pass_3) { FlightPassenger.create!(flight_id: flight_1.id, passenger_id: pass_3.id ) }

      let!(:flight_pass_4) { FlightPassenger.create!(flight_id: flight_2.id, passenger_id: pass_2.id ) }


      # Story 1

      it "displays a list of flights" do
        visit flights_path

        expect(page).to have_content("Flight Number: #{flight_1.number}")
        expect(page).to have_content("Flight Name: #{flight_1.airline.name}")
        expect(page).to have_content("Passengers:")
        expect(page).to have_content(pass_1.name)
        expect(page).to have_content(pass_2.name)
        expect(page).to have_content(pass_3.name)

        expect(page).to have_content(flight_2.number)
        expect(page).to have_content(flight_2.airline.name)
        expect(page).to have_content(pass_1.name)

        expect(page).to have_content(flight_3.number)
        expect(page).to have_content(flight_3.airline.name)

      end

      # Story 2

      it "has a link or button to remove a passenger next to each passengers name" do
        visit flights_path

        # within "#passengers" do

        # expect(page).to have_link("Delete #{pass_1.name}", id: "delete-passenger-#{pass_1.id}")
          expect(page).to have_link "Delete #{pass_1.name}"
          expect(page).to have_link "Delete #{pass_2.name}"
          expect(page).to have_link "Delete #{pass_3.name}"

        click_link "Delete #{pass_1.name}"
        # end

        # click_link "Delete #{pass_1.name}"
        # find("#delete-passenger-#{pass_1.id}").click

        expect(current_path).to eq(flights_path)

        expect(page).to_not have_link("Delete #{pass_1.name}", id: "delete-passenger-#{pass_1.id}")

        # within "#passengers" do
          expect(page).to_not have_link("Delete #{pass_1.name}")
          expect(page).to have_link("Delete #{pass_2.name}")
          expect(page).to have_link("Delete #{pass_3.name}")
        # end
        # expect(page).to have_link "Delete #{pass_2.name}"
        # expect(page).to have_link "Delete #{pass_3.name}"
      end
    end

  end


end


# User Story 1, Flights Index Page

# As a visitor
# When I visit the flights index page
# I see a list of all flight numbers
# And next to each flight number I see the name of the Airline of that flight
# And under each flight number I see the names of all that flight's passengers

# User Story 2, Remove a Passenger from a Flight

# As a visitor
# When I visit the flights index page
# Next to each passengers name
# I see a link or button to remove that passenger from that flight
# When I click on that link/button
# I'm returned to the flights index page
# And I no longer see that passenger listed under that flight,
# And I still see the passenger listed under the other flights they were assigned to.


# <% flight.passengers.each do |passenger| %>
#   <%= passenger.name %>
# <% end %>

# <div id="passengers">
# </div>
