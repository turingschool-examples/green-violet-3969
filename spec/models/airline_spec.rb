require "rails_helper"

RSpec.describe Airline, type: :model do
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

  describe "relationships" do
    it {should have_many :flights}
    it {should have_many(:passengers).through(:flights)}
  end

  describe "instance_methods" do
    it '#unique_adult_pass' do
    expect(delta.unique_adult_pass).to eq([pass_2, pass_3])
    end
  end
end
