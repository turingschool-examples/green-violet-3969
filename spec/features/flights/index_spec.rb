require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before(:each) do
    @airline1 = Airline.create!(name: 'Frontier')
    @airline2 = Airline.create!(name: 'United')
    @flight1 = @airline1.flights.create!(number: '1727', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
    @flight2 = @airline1.flights.create!(number: '1827', date: '12/08/20', departure_city: 'Santa Fe', arrival_city: 'Portland')
    @flight3 = @airline1.flights.create!(number: '1927', date: '08/19/20', departure_city: 'Denver', arrival_city: 'Portland')
    @flight4 = @airline2.flights.create!(number: '2027', date: '05/02/20', departure_city: 'New York', arrival_city: 'Santa Barbara')
    @flight5 = @airline2.flights.create!(number: '2127', date: '09/03/20', departure_city: 'Kansas City', arrival_city: 'San Francisco')
    @passenger1 = Passenger.create!(name: 'Joe', age: 7)
    @passenger2 = Passenger.create!(name: 'Sally', age: 25)
    @passenger3 = Passenger.create!(name: 'Cory', age: 32)
    @passenger4 = Passenger.create!(name: 'Mary', age: 12)
    @passenger5 = Passenger.create!(name: 'Mike', age: 21)
    @passenger6 = Passenger.create!(name: 'John', age: 65)
    @passenger7 = Passenger.create!(name: 'Zack', age: 42)
    @passenger8 = Passenger.create!(name: 'Jill', age: 13)
    @flight_passenger1 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
    @flight_passenger2 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
    @flight_passenger3 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
    @flight_passenger4 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger4.id)
    @flight_passenger5 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger5.id)
    @flight_passenger6 = FlightPassenger.create!(flight_id: @flight4.id, passenger_id: @passenger6.id)
    @flight_passenger7 = FlightPassenger.create!(flight_id: @flight5.id, passenger_id: @passenger7.id)
    @flight_passenger8 = FlightPassenger.create!(flight_id: @flight5.id, passenger_id: @passenger8.id)

    visit flights_path
  end
  describe 'As a visitor, when I visit the flights index page' do
    it 'displays a list of all flight numbers and the airline next to each number' do
      expect(page).to have_content("Flight Number: #{@flight1.number} - Airline: #{@airline1.name}")
      expect(page).to have_content("Flight Number: #{@flight2.number} - Airline: #{@airline1.name}")
      expect(page).to have_content("Flight Number: #{@flight3.number} - Airline: #{@airline1.name}")
      expect(page).to have_content("Flight Number: #{@flight4.number} - Airline: #{@airline2.name}")
      expect(page).to have_content("Flight Number: #{@flight5.number} - Airline: #{@airline2.name}")
    end

    it 'displays the names of all passengers on each flight' do
      within(".flight-#{@flight1.number}") do
        expect(page).to have_content(@passenger1.name)
        expect(page).to have_content(@passenger2.name)
      end

      within(".flight-#{@flight2.number}") do
        expect(page).to have_content(@passenger3.name)
        expect(page).to have_content(@passenger4.name)
      end

      within(".flight-#{@flight3.number}") do
        expect(page).to have_content(@passenger5.name)
      end

      within(".flight-#{@flight4.number}") do
        expect(page).to have_content(@passenger6.name)
      end

      within(".flight-#{@flight5.number}") do
        expect(page).to have_content(@passenger7.name)
        expect(page).to have_content(@passenger8.name)
      end
    end
  end
end