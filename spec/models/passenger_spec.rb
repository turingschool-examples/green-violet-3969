require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it { should have_many :passenger_flights }
    it { should have_many(:flights).through(:passenger_flights) }
  end

  describe "class methods" do
    describe "#passenger.unique_adults" do
      it "returns an airlines unique adult passengers" do
        airline1 = Airline.create!(name: "Superjet")

        flight1 = airline1.flights.create!(number: "2468", date: "12/31/1999", departure_city: "Boston", arrival_city: "Miami")
        flight2 = airline1.flights.create!(number: "1357", date: "02/04/2006", departure_city: "Denver", arrival_city: "London")

        passenger1 = Passenger.create!(name: "Rocky", age: 50)
        passenger2 = Passenger.create!(name: "Shelly", age: 45)
        passenger3 = Passenger.create!(name: "Janie", age: 12)
        passenger4 = Passenger.create!(name: "Will", age: 2)

        PassengerFlight.create!(flight: flight1, passenger: passenger1)
        PassengerFlight.create!(flight: flight1, passenger: passenger2)
        PassengerFlight.create!(flight: flight1, passenger: passenger3)
        PassengerFlight.create!(flight: flight1, passenger: passenger4)
        PassengerFlight.create!(flight: flight2, passenger: passenger1)
        PassengerFlight.create!(flight: flight2, passenger: passenger2)

        expect(Passenger.unique_adults(airline1)).to eq([passenger1, passenger2])
      end
    end
  end
end
#     describe '.sorted_by_flight_count' do
#       let(:airline) { Airline.create!(name: 'Test Airline') }

#       it 'returns passengers sorted by the number of flights taken on the airline' do
#         passenger1 = Passenger.create!(name: 'Passenger 1', age: 30)
#         passenger2 = Passenger.create!(name: 'Passenger 2', age: 25)
#         passenger3 = Passenger.create!(name: 'Passenger 3', age: 40)

#         flight1 = Flight.create!(number: '123', airline: airline)
#         flight2 = Flight.create!(number: '456', airline: airline)
#         flight3 = Flight.create!(number: '789', airline: airline)

#         PassengerFlight.create!(passenger: passenger1, flight: flight1)
#         PassengerFlight.create!(passenger: passenger1, flight: flight2)
#         PassengerFlight.create!(passenger: passenger2, flight: flight1)
#         PassengerFlight.create!(passenger: passenger3, flight: flight1)
#         PassengerFlight.create!(passenger: passenger3, flight: flight2)
#         PassengerFlight.create!(passenger: passenger3, flight: flight3)

#         sorted_passengers = Passenger.sorted_by_flight_count(airline)

#         expect(sorted_passengers).to eq([passenger3, passenger1, passenger2])
#       end
#     end
#   end
# end