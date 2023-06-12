require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many :flights }
    it { should have_many(:passengers).through(:flights) }
  end

  describe '#passengers' do
    it 'returns unique names of adult passengers for the airline' do
      airline = Airline.create(name: 'Frontier')
      passenger1 = Passenger.create(name: 'John Doe', age: 25)
      passenger2 = Passenger.create(name: 'Jane Smith', age: 25)
      passenger3 = Passenger.create(name: 'Jane Smith', age: 25)
      flight1 = airline.flights.create(number: '1727', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
      flight2 = airline.flights.create(number: '1827', date: '12/08/20', departure_city: 'Santa Fe', arrival_city: 'Portland')
      FlightPassenger.create(flight: flight1, passenger: passenger1)
      FlightPassenger.create(flight: flight1, passenger: passenger2)
      FlightPassenger.create(flight: flight2, passenger: passenger3)

      passengers = airline.passengers.adult.distinct.pluck(:name)


      expect(passengers.count).to eq(2)
      expect(passengers).to eq([passenger2.name, passenger1.name])

    end
  end
end

