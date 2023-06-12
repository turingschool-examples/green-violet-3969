
# And next to each flight number I see the name of the Airline of that flight
# And under each flight number I see the names of all that flight's passengers

require "rails_helper"

RSpec.describe 'Flight Index Page', type: :feature do
  let!(:delta) { Airline.create!(name: "Delta Airlines") }
  let!(:eva) { Airline.create!(name: "Eva Airlines") }
  let!(:united) { Airline.create!(name: "United Airlines") }
  let!(:braniff) { Airline.create!(name: "Braniff Airlines") }
  
  let!(:flight721) { delta.flights.create!(number: "721", date: "07/21/1985", departure_city: "Durango, CO", arrival_city: "Weymouth, MA") }
  let!(:flight510) { eva.flights.create!(number: "510", date: "05/10/1991", departure_city: "Chaiyi City, TW", arrival_city: "Taipei, TW") }
  
  let!(:pass_1) { Passenger.create!(name: "Julian", age: 0) }
  let!(:pass_2) { Passenger.create!(name: "Stephany", age: 25) }
  let!(:pass_3) { Passenger.create!(name: "Louis", age: 28) }
  let!(:pass_4) { Passenger.create!(name: "Yu-Ting", age: -5) }
  
  let!(:pass_flight_1) { PassengerFlight.create!(flight_id: flight721.id, passenger_id: pass_1.id) }
  let!(:pass_flight_2) { PassengerFlight.create!(flight_id: flight721.id, passenger_id: pass_2.id) }
  let!(:pass_flight_3) { PassengerFlight.create!(flight_id: flight721.id, passenger_id: pass_3.id) }
  # let!(:pass_flight_4) { PassengerFlight.create!(flight_id: flight510.id, passenger_id: pass_4.id) }

  describe 'Display a list of flights with attributes and associations' do
    it 'should display flights by number' do
      visit flights_path

      expect(page).to have_content("Flight Number and Airline")
      expect(page).to have_content(flight721.number)
      expect(page).to have_content(flight510.number)
    end

    it 'should display the name of the airline the flight belongs to' do
      visit flights_path

      expect(page).to have_content(delta.name)
      expect(page).to have_content(eva.name)
      expect(page).to_not have_content(braniff.name)
    end

    it 'should display the list of passengers per flight' do
      visit flights_path
      
      expect(page).to have_content(pass_1.name)
      expect(page).to have_content(pass_2.name)
      expect(page).to have_content(pass_3.name)
      expect(page).to_not have_content(pass_4.name)
    end
  end
end
