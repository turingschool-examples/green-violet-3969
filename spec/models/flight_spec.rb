require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "relationships" do
    it {should belong_to :airline}
    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  it "can remove a passenger from a flight" do
    airline = Airline.create(name: 'Example Airlines')
    flight = airline.flights.create(number: '123', date: '2023-06-10', departure_city: 'City A', arrival_city: 'City B')
    passenger1 = Passenger.create(name: 'John Doe', age: 25)
    passenger2 = Passenger.create(name: 'Jane Doe', age: 30)
    FlightPassenger.create(flight: flight, passenger: passenger1)
    FlightPassenger.create(flight: flight, passenger: passenger2)
    
    visit "/flights/#{flight.id}"

    click_button("Remove #{passenger1.name}")

    expect(current_path).to eq("/flights/#{flight.id}")
    expect(flight.passengers.count).to eq(1)
    expect(flight.passengers).to_not have_content(passenger1.name)
  end
end
