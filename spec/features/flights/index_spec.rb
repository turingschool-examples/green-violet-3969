require "rails_helper"

describe "Flights Index page" do
  before :each do
    @airline1 = Airline.create!(name: "Delta")
    @airline2 = Airline.create!(name: "Southwest")
    @flight1 = Flight.create!(number: "2807", date: "08/03/20", departure_city: "DIA", arrival_city: "DFW", airline_id: @airline2.id)
    @flight2 = Flight.create!(number: "7778", date: "01/12/20", departure_city: "BWI", arrival_city: "LAX", airline_id: @airline1.id)
    @flight3 = Flight.create!(number: "4333", date: "07/04/20", departure_city: "LGA", arrival_city: "JFK", airline_id: @airline2.id)
    @flight4 = Flight.create!(number: "1111", date: "04/20/20", departure_city: "LUV", arrival_city: "OKC", airline_id: @airline1.id)
    @passenger1 = Passenger.create!(name: "John Smith", age: 21)
    @passenger2 = Passenger.create!(name: "Emily", age: 34 )
    @passenger3 = Passenger.create!(name: "Kara", age: 30 )
    @passenger4 = Passenger.create!(name: "Gertie", age: 4 )
    @pass_flight1 = PassengersFlight.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @pass_flight2 = PassengersFlight.create!(passenger_id: @passenger2.id, flight_id: @flight2.id)
    @pass_flight3 = PassengersFlight.create!(passenger_id: @passenger3.id, flight_id: @flight3.id)
    @pass_flight4 = PassengersFlight.create!(passenger_id: @passenger4.id, flight_id: @flight1.id)
  end

  describe "As a visitor, when I visit the flights index page" do
    #US 1
    it "displays a list of all flight numbers" do
      visit flights_path
      expect(page).to have_content("Flights Index")

    end

    it "displays the name of the Airline next to each flight number" do

    end

    it "displays under each flight number the names of all the flight's passengers" do

    end
  end
end
