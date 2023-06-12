require 'rails_helper'

RSpec.describe FlightPassenger, type: :model do
  it { should belong_to :flight }
  it { should belong_to :passenger }

  describe '#remove_passenger' do
    it 'removes the flight passenger record for a given flight and passenger' do
      airline = Airline.create(name: 'Frontier')
      passenger = Passenger.create(name: 'John Doe')
      flight = airline.flights.create(number: '1727', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
      flight_passenger = FlightPassenger.create(flight: flight, passenger: passenger)

      FlightPassenger.remove_passenger(flight: flight, passenger: passenger)

      expect(FlightPassenger.where(flight: flight, passenger: passenger)).to be_empty
    end
  end
end
