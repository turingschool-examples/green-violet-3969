require "rails_helper"

RSpec.describe "Airline Show Page" do
  before :each do
    @airline_1 = Airline.create!(name: "Delta")
    @airline_2 = Airline.create!(name: "United")

    @flight_1 = @airline_1.flights.create!(number: "123", date: "01/01/01", departure_city: "Denver", arrival_city: "New York")
    @flight_2 = @airline_1.flights.create!(number: "456", date: "02/02/02", departure_city: "New York", arrival_city: "Denver")
    @flight_3 = @airline_2.flights.create!(number: "789", date: "03/03/03", departure_city: "Denver", arrival_city: "Los Angeles")

    @passenger_1 = Passenger.create!(name: "Bob", age: 13)
    @passenger_2 = Passenger.create!(name: "Jane", age: 30)
    @passenger_3 = Passenger.create!(name: "Joe", age: 40)
    @passenger_4 = Passenger.create!(name: "Jill", age: 7)
    @passenger_5 = Passenger.create!(name: "Jack", age: 60)
    @passenger_6 = Passenger.create!(name: "Javen", age: 22)
    @passenger_7 = Passenger.create!(name: "Owen", age: 25)

    @passenger_flight_1 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
    @passenger_flight_2 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
    @passenger_flight_3 = PassengerFlight.create!(flight_id: @flight_2.id, passenger_id: @passenger_3.id)
    @passenger_flight_4 = PassengerFlight.create!(flight_id: @flight_2.id, passenger_id: @passenger_4.id)
    @passenger_flight_5 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_5.id)
    @passenger_flight_6 = PassengerFlight.create!(flight_id: @flight_3.id, passenger_id: @passenger_6.id)
    @passenger_flight_7 = PassengerFlight.create!(flight_id: @flight_3.id, passenger_id: @passenger_7.id)
    @passenger_flight_8 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_3.id)
    @passenger_flight_8 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_4.id)
  end
  describe "As a visitor" do
    describe "When I visit an airline's show page" do
      it "shows a unique list of adult passengers that have flights on that airline" do
        visit airline_path(@airline_1)

        expect(page).to have_content("#{@airline_1.name} Airlines")

        within("#adult-passengers") do
          expect(page).to have_content("Adult Passengers:")
          expect(page).to have_content("Name: #{@passenger_5.name}")
          expect(page).to have_content("Name: #{@passenger_2.name}")
          expect(page).to have_content("Name: #{@passenger_3.name}")
          expect(page).to_not have_content("Name: #{@passenger_4.name}")
          expect(page).to_not have_content("Name: #{@passenger_1.name}")
          expect(page).to_not have_content("Name: #{@passenger_6.name}")
          expect(page).to_not have_content("Name: #{@passenger_7.name}")
        end
      end
    end
  end
end