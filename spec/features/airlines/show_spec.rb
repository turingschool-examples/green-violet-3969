require "rails_helper"

RSpec.describe "airline#show" type: :feature do
  before(:each) do
    @airline1 = Airline.create!(name: "Superjet")

    @flight1 = @airline1.flights.create!(number: "2468", date: "12/31/1999", departure_city: "Boston", arrival_city: "Miami")
    @flight2 = @airline1.flights.create!(number: "1357", date: "02/04/2006", departure_city: "Denver", arrival_city: "London")

    @passenger1 = Passenger.create!(name: "Rocky", age: 20)
    @passenger2 = Passenger.create!(name: "Shelly", age: 45)
    @passenger3 = Passenger.create!(name: "Janie", age: 17)
    @passenger4 = Passenger.create!(name: "Rocky", age: 20)

    PassengerFlight.create!(flight: @flight1, passenger: @passenger1)
    PassengerFlight.create!(flight: @flight1, passenger: @passenger2)
    PassengerFlight.create!(flight: @flight1, passenger: @passenger3)
    PassengerFlight.create!(flight: @flight2, passenger: @passenger4)
  end

  # User Story 3, Airline's Passengers

  # As a visitor
  # When I visit an airline's show page
  # Then I see a list of passengers that have flights on that airline
  # And I see that this list is unique (no duplicate passengers)
  # And I see that this list only includes adult passengers.

  it "shows a list of unique adult passengers for that airline" do
    visit airline_path(@airline1)

    within("#passenger-list") do
      expect(page).to have_content(@passenger1.name, count: 1)
      expect(page).to have_content(@passenger2.name)
      expect(page).not_to have_content(@passenger3.name)
    end
  end
  end
