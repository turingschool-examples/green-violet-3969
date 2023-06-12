require "rails_helper" 

RSpec.describe "Flights Index Page", type: :feature do 
  before(:each) do 
    @airline1 = Airline.create!(name: "I Believe I Can Fly")
    @airline2 = Airline.create!(name: "Glide Like a Turkey Air")
    @flight1 = @airline1.flights.create!(number: "2984", date: "09/07/22", departure_city: "Phoenix", arrival_city: "Denver")
    @flight2 = @airline1.flights.create!(number: "3484", date: "09/07/22", departure_city: "Los Angeles", arrival_city: "Sacremento")
    @flight3 = @airline2.flights.create!(number: "9376", date: "09/10/22", departure_city: "New Orleans", arrival_city: "Memphis")
    @flight4 = @airline1.flights.create!(number: "9376", date: "06/09/22", departure_city: "Chicago", arrival_city: "New York City")
    @flight5 = @airline2.flights.create!(number: "9309", date: "09/23/23", departure_city: "Salt Lake City", arrival_city: "Seattle")
    @flight6 = @airline2.flights.create!(number: "9765", date: "09/28/22", departure_city: "Denver", arrival_city: "Chicago")
    @passenger1 = Passenger.create!(name: "Wolfie", age: 2)
    @passenger2 = Passenger.create!(name: "Maggie", age: 7)
    @passenger3 = Passenger.create!(name: "Circe", age: 3)
    @pass_flight1 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @pass_flight2 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @pass_flight3 = PassengerFlight.create!(passenger_id: @passenger3.id, flight_id: @flight1.id)
    @pass_flight4 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight2.id)
    @pass_flight5 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight3.id)
    @pass_flight6 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight2.id)
  end

  it "displays a list of all flight numbers with airline and passenger information" do 
    visit flights_path

    within("#flight-#{@flight1.id}") do 
      expect(page).to have_content("Flight Number: #{@flight1.number}")
      expect(page).to have_content("Airline: #{@flight1.airline}")
      expect(page).to have_content("Passengers:")
      expect(page).to have_content("Wolfie")
      expect(page).to have_content("Maggie")
      expect(page).to have_content("Circe")
    end

    within("#flight-#{@flight2.id}") do 
      expect(page).to have_content("Flight Number: #{@flight2.number}")
      expect(page).to have_content("Airline: #{@flight2.airline}")
      expect(page).to have_content("Passengers:")
      expect(page).to have_content("Wolfie")
      expect(page).to have_content("Maggie")
    end

    within("#flight-#{@flight3.id}") do 
      expect(page).to have_content("Flight Number: #{@flight3.number}")
      expect(page).to have_content("Airline: #{@flight3.airline}")
      expect(page).to have_content("Passengers:")
      expect(page).to have_content("Wolfie")
    end
  end
end