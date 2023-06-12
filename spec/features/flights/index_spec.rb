require "rails_helper"

RSpec.describe "Flights Index Page" do
  before :each do
    @airline_1 = Airline.create!(name: "Delta")
    @airline_2 = Airline.create!(name: "United")

    @flight_1 = @airline_1.flights.create!(number: "123", date: "01/01/01", departure_city: "Denver", arrival_city: "New York")
    @flight_2 = @airline_1.flights.create!(number: "456", date: "02/02/02", departure_city: "New York", arrival_city: "Denver")
    @flight_3 = @airline_2.flights.create!(number: "789", date: "03/03/03", departure_city: "Denver", arrival_city: "Los Angeles")

    @passenger_1 = Passenger.create!(name: "Bob", age: 20)
    @passenger_2 = Passenger.create!(name: "Jane", age: 30)
    @passenger_3 = Passenger.create!(name: "Joe", age: 40)
    @passenger_4 = Passenger.create!(name: "Jill", age: 50)
    @passenger_5 = Passenger.create!(name: "Jack", age: 60)

    @passenger_flight_1 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
    @passenger_flight_2 = PassengerFlight.create!(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
    @passenger_flight_3 = PassengerFlight.create!(flight_id: @flight_2.id, passenger_id: @passenger_3.id)
    @passenger_flight_4 = PassengerFlight.create!(flight_id: @flight_3.id, passenger_id: @passenger_4.id)
    @passenger_flight_5 = PassengerFlight.create!(flight_id: @flight_3.id, passenger_id: @passenger_5.id)
  end

  describe "As a visitor" do
    describe "When I visit the flights index page" do
      it "I see a list of all flight numbers, including name of airline of that flight and names of passengers" do
        visit flights_path
save_and_open_page
        expect(page).to have_content("Flights Index Page")

        within("#flight_number-#{@flight_1.number}") do
          expect(page).to have_content("Flight Number: 123")
        end

        within("#flight_number-#{@flight_2.number}") do
          expect(page).to have_content("Flight Number: 456")
        end

        within("#flight_number-#{@flight_3.number}") do
          expect(page).to have_content("Flight Number: 789")
        end

        # within("#airline-#{@airline_1.name}") do
          expect(page).to have_content("Airline: Delta")
        # end

        # within("#airline-#{@airline_2.name}") do
          expect(page).to have_content("Airline: United")
        # end

        within("#passenger_names-#{@flight_1.number}") do
          expect(page).to have_content("Bob")
          expect(page).to have_content("Jane")
        end

        within("#passenger_names-#{@flight_2.number}") do
          expect(page).to have_content("Joe")
        end

        within("#passenger_names-#{@flight_3.number}") do
          expect(page).to have_content("Jill")
          expect(page).to have_content("Jack")
        end
      end
    end
  end
end