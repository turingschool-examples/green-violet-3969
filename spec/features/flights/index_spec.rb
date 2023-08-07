require "rails_helper"

RSpec.describe "flight index" do
  it "should show list of all flight numbers" do
    airline1 = Airline.create!(name: "SW")

    flight1 = Flight.create!(number: 1, date: "08112023", departure_city: "reno", arrival_city: "las vegas", airline_id: airline1.id)
    flight2 = Flight.create!(number: 2, date: "08112023", departure_city: "reno", arrival_city: "denver", airline_id: airline1.id)
    flight3 = Flight.create!(number: 3, date: "08/11/2023", departure_city: "reno", arrival_city: "dallas", airline_id: airline1.id)

    passenger1 = Passenger.create!(name: "Niki", age: 31)
    passenger2 = Passenger.create!(name: "Robert", age: 33)
    passenger3 = Passenger.create!(name: "Felicia", age: 31)
    passenger4 = Passenger.create!(name: "Charles", age: 32)

    FlightPassenger.create!(flight: flight1, passenger: passenger1)
    FlightPassenger.create!(flight: flight1, passenger: passenger2)
    FlightPassenger.create!(flight: flight1, passenger: passenger3)
    FlightPassenger.create!(flight: flight2, passenger: passenger3)
    FlightPassenger.create!(flight: flight2, passenger: passenger4)

    visit "/flights"
    # save_and_open_page
    expect(page).to have_content(flight1.number)
    expect(page).to have_content(flight2.number)
    expect(page).to have_content(flight3.number)
  end

  it "should have a button to remove passengers from a flight" do
  airline1 = Airline.create!(name: "SW")

  flight1 = Flight.create!(number: 1, date: "08112023", departure_city: "reno", arrival_city: "las vegas", airline_id: airline1.id)
  flight2 = Flight.create!(number: 2, date: "08112023", departure_city: "reno", arrival_city: "denver", airline_id: airline1.id)
  passenger1 = Passenger.create!(name: "Niki", age: 31)
  passenger2 = Passenger.create!(name: "Robert", age: 33)

  FlightPassenger.create!(flight: flight1, passenger: passenger1)
  FlightPassenger.create!(flight: flight2, passenger: passenger1)
  FlightPassenger.create!(flight: flight2, passenger: passenger2)

    visit "/flights"

    within "#flight-#{flight1.id}" do
      expect(page).to have_link("Remove Niki")
      click_link("Remove Niki")
    end
    
    expect(page).to have_content("Passenger removed from the flight successfully!")
  
    within "#flight-#{flight2.id}" do
      expect(page).to have_link("Remove Niki")
      expect(page).to have_link("Remove Robert")
  
      click_link("Remove Robert")
    end
  
    expect(page).to have_content("Passenger removed from the flight successfully!")
    expect(page).to have_link("Remove Niki")
    expect(page).not_to have_link("Remove Robert")
  end
end