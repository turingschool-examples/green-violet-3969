require "rails_helper"

RSpec.describe "Airline's Passengers", type: :feature do
  let!(:airline) { Airline.create(name: "Frontier") }
  let!(:flight1) { Flight.create(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno", airline: airline) }
  let!(:flight2) { Flight.create(number: "2345", date: "08/04/20", departure_city: "Reno", arrival_city: "Denver", airline: airline) }
  let!(:passenger1) { Passenger.create(name: "Joe", age: 7) }
  let!(:passenger2) { Passenger.create(name: "Jane", age: 25) }
  let!(:passenger3) { Passenger.create(name: "John", age: 35) }

  it "displays a list of unique adult passengers for an airline" do
    visit airline_path(airline)

    expect(page).to have_content("Airline: Frontier")
    expect(page).to have_content("Adult Passengers:")
    expect(page).to have_content("Jane")
    expect(page).to have_content("John")
    expect(page).not_to have_content("Joe")
  end
end
