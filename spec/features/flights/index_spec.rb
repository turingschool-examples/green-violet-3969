require "rails_helper"

describe "flights index page" do
  before :each do
    @airline1 = Airline.create!(name: "Southwest")
    @airline2 = Airline.create!(name: "Spirit")
  
    @flight1 = Flight.create!(number: "0420", date: "06/24/2023", departure_city: "Dulles", arrival_city: "Denver", airline_id: @airline1.id)
    @flight2 = Flight.create!(number: "6969", date: "06/24/2023", departure_city: "DC", arrival_city: "Richmond", airline_id: @airline1.id)
    @flight3 = Flight.create!(number: "2121", date: "06/24/2023", departure_city: "Atlanta", arrival_city: "Broomfield", airline_id: @airline2.id)
  
    @passenger1 = Passenger.create!(name: "Ace Ventura", age: 35, flight_id: @flight1.id)
    @passenger2 = Passenger.create!(name: "Tom Hanks", age: 70, flight_id: @flight1.id)
    @passenger3 = Passenger.create!(name: "Lisa Leslie", age: 45, flight_id: @flight2.id)
    @passenger4 = Passenger.create!(name: "Dan Rather", age: 75, flight_id: @flight2.id)
    @passenger5 = Passenger.create!(name: "Vin Diesel", age: 48, flight_id: @flight3.id)

    @passenger_flight1 = PassengerFlight.create!(flight_id: @flight1, passenger_id: @passenger1)
  end
  

  it "should display a list of all flight numbers, and next to each flight number I see the name of the Airline of that flight" do
    visit "/flights"

    expect(page).to have_content("Flights Index Page")
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)

    expect(page).to_not have_content(@flight1.date)
    expect(page).to_not have_content(@flight1.departure_city)
    expect(page).to_not have_content(@flight1.arrival_city)
    expect(page).to_not have_content(@flight2.date)
    expect(page).to_not have_content(@flight2.departure_city)
    expect(page).to_not have_content(@flight2.arrival_city)
    expect(page).to_not have_content(@flight3.date)
    expect(page).to_not have_content(@flight3.departure_city)
    expect(page).to_not have_content(@flight3.arrival_city)

    expect(page).to have_content(@flight1.airline.name)
    expect(page).to have_content(@flight2.airline.name)
    expect(page).to have_content(@flight3.airline.name)
  end

  it "under each flight number I see the names of all that flight's passengers" do
    visit "/flights"
    expect(page).to have_content("Passengers:")
  
    expect(page).to have_content("Ace Ventura")
    expect(page).to have_content("Tom Hanks")
    expect(page).to have_content("Lisa Leslie")
    expect(page).to have_content("Dan Rather")
    expect(page).to have_content("Vin Diesel")
  end

  xit "displays a link to remove a passenger" do
    visit "/flights"
    expect(page).to have_button("Remove passenger from flight")
    click_button("Remove passenger from flight")
    expect(current_path).to eq("/flights")
  end
end