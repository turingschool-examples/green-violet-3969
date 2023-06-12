require 'rails_helper'

RSpec.describe 'Airline Show Page' do
  describe 'When I visit an airlines show page' do
    before :each do
      @airline1 = Airline.create!(name: 'Frontier')
      @flight1 = @airline1.flights.create!(number: '1727', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
      @flight2 = @airline1.flights.create!(number: '1827', date: '12/08/20', departure_city: 'Santa Fe', arrival_city: 'Portland')
      @flight3 = @airline1.flights.create!(number: '1927', date: '08/19/20', departure_city: 'Denver', arrival_city: 'Portland')
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
      @flight_passenger6 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger8.id)

      visit airline_path(@airline1)
    end

    it 'displays a list of passengers that have flights on that airline' do
      save_and_open_page
      expect(page).to have_content("#{@passenger2.name}")
      expect(page).to have_content("#{@passenger3.name}")

      expect(page).to_not have_content("#{@passenger1.name}")
      expect(page).to_not have_content("#{@passenger8.name}")
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