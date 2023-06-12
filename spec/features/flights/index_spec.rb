require 'rails_helper' 

RSpec.describe 'Flights Index' do 
  before(:each) do 
    @airline = Airline.create!(name: 'United')
    @flight_1 = Flight.create!(number: '1234', date: '06/12/23', departure_city: 'Denver', arrival_city: 'Miami', airline: @airline)
    @flight_2 = Flight.create!(number: '1727', date: '08/03/23', departure_city: 'Denver', arrival_city: 'Reno', airline: @airline)
    @flight_3 = Flight.create!(number: '4568', date: '06/12/23', departure_city: 'Denver', arrival_city: 'San Francisco', airline: @airline)
    @passenger_1 = Passenger.create!(name: 'Joe', age: 7)
    @passenger_2 = Passenger.create!(name: 'Ann', age: 43)
    @passenger_3 = Passenger.create!(name: 'Jess', age: 76)
    @passenger_4 = Passenger.create!(name: 'Wesley', age: 24)

    PassengerFlight.create!(flight: @flight_1, passenger: @passenger_1)
    PassengerFlight.create!(flight: @flight_2, passenger: @passenger_2)
    PassengerFlight.create!(flight: @flight_3, passenger: @passenger_3)
    PassengerFlight.create!(flight: @flight_3, passenger: @passenger_4)

    visit "/flights"
  end
  describe 'flights index page' do 
    it 'displays a list of flight numbers' do 
      within("#flight-#{@flight_1.id}") do
        expect(page).to have_content(@airline.name)
        expect(page).to have_content("Joe")
      end

      within("#flight-#{@flight_2.id}") do
        expect(page).to have_content(@airline.name)
        expect(page).to have_content("Ann")
      end

      within("#flight-#{@flight_3.id}") do
        expect(page).to have_content(@airline.name)
        expect(page).to have_content("Jess")
        expect(page).to have_content("Wesley")
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