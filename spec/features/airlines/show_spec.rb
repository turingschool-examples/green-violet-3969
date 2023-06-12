require 'rails_helper' 

RSpec.describe 'Airline Show Page' do 
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

    visit airline_path(@airline)
  end

  describe "Airline's Passengers" do 
    it 'airline show page has list of adult passengers without duplicates' do 
      within("#passengers") do 
        expect(page).to_not have_content(@passenger_1.name, count: 1)
        expect(page).to have_content(@passenger_2.name, count: 1)
        expect(page).to have_content(@passenger_3.name, count: 1)
        expect(page).to have_content(@passenger_4.name, count: 1)
      end
    end
  end
end