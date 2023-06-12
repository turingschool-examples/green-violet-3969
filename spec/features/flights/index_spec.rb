require "rails_helper"

RSpec.describe "Flights Index Page", type: :feature do
  let!(:airline) { Airline.create(name: "Frontier") }
  let!(:flight1) { Flight.create(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno", airline: airline) }
  let!(:flight2) { Flight.create(number: "2345", date: "08/04/20", departure_city: "Reno", arrival_city: "Denver", airline: airline) }
  let!(:passenger1) { Passenger.create(name: "Joe", age: 7) }

  it "displays a list of all flight numbers, associated airline, and passengers" do
    visit "/flights"

    expect(page).to have_content(flight1.number)
    expect(page).to have_content(flight1.airline.name)
    expect(page).to have_content(passenger1.name)

    expect(page).to have_content(flight2.number)
    expect(page).to have_content(flight2.airline.name)
  end

  it "removes a passenger from a flight and redirects to the flights index page" do
    visit "/flights"

    within("#flight_#{flight1.id}") do
      expect(page).to have_content(passenger1.name)
      click_link "Remove"
    end

    expect(current_path).to eq(flights_path)
    expect(page).not_to have_content(passenger1.name)
  end
end

