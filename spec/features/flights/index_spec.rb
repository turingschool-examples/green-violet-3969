require "rails_helper"

RSpec.describe "flight#index", type: :feature do
  before(:each) do
    @airline1 = Airline.create!(name: "Superjet")

    @flight1 = @airline1.flights.create!(number: "2468", date: "12/31/1999", departure_city: "Boston", arrival_city: "Miami")
    @flight2 = @airline1.flights.create!(number: "1357", date: "02/04/2006", departure_city: "Denver", arrival_city: "London")
    @flight3 = @airline1.flights.create!(number: "0716", date: "08/17/2008", departure_city: "Dallas", arrival_city: "Honolulu")

    @passenger1 = Passenger.create!(name: "Rocky", age: 50)
    @passenger2 = Passenger.create!(name: "Shelly", age: 45)
    @passenger3 = Passenger.create!(name: "Janie", age: 12)
    @passenger4 = Passenger.create!(name: "Will", age: 2)

    PassengerFlight.create!(flight: @flight1, passenger: @passenger1)
    PassengerFlight.create!(flight: @flight1, passenger: @passenger2)
    PassengerFlight.create!(flight: @flight1, passenger: @passenger3)
    PassengerFlight.create!(flight: @flight1, passenger: @passenger4)
    PassengerFlight.create!(flight: @flight2, passenger: @passenger1)
    PassengerFlight.create!(flight: @flight2, passenger: @passenger2)
  end

  it "should display all flights" do
    visit flights_path

    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
    expect(page).to have_content(@flight3.number)

    within("#passenger-list-#{@flight1.id}") do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
    end
  end

  # User Story 2, Remove a Passenger from a Flight

  # As a visitor
  # When I visit the flights index page
  # Next to each passengers name
  # I see a link or button to remove that passenger from that flight
  # When I click on that link/button
  # I'm returned to the flights index page
  # And I no longer see that passenger listed under that flight,
  # And I still see the passenger listed under the other flights they were assigned to.

  it "can remove a passenger from the flight" do
    visit flights_path

    within("#passenger-list-#{@flight1.id}") do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)

    click_on "Remove #{@passenger1.name}"
    end

  expect(current_path).to eq("/flights")

    within("#passenger-list-#{@flight1.id}") do
      expect(page).not_to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
    end

    within("#passenger-list-#{@flight2.id}") do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
    end
  end
end

