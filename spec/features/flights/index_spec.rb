require "rails_helper"

# User Story 1, Flights Index Page

# As a visitor
# When I visit the flights index page
# I see a list of all flight numbers
# And next to each flight number I see the name of the Airline of that flight
# And under each flight number I see the names of all that flight's passengers

describe "Flights index spec" do
  before(:each) do
    @airline1 = Airline.create!(name: "Alaska")
    @airline2 = Airline.create!(name: "Southwest")
    @airline3 = Airline.create!(name: "San Juan")

    @flight1 = @airline1.flights.create!(number: "1a", date: "May.1.2023", departure_city: "Seattle", arrival_city: "Denver")
    @flight2 = @airline2.flights.create!(number: "2a", date: "May.2.2023", departure_city: "Portland", arrival_city: "Spokane")
    @flight3 = @airline3.flights.create!(number: "3a", date: "May.3.2023", departure_city: "San Fran", arrival_city: "Las Vegas")
  end

  describe "Displaying Flight Information" do
    it "see all flight numbers" do
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@flight3.number)
    end

  #   it "see name of Airline next to flight number"
  #   within "#flight-#{@flight1.id}" do
  #     expect(page).to have_content(@airline1.name)
  #     expect(page).to_not have_content(@airline2.name)
  #     expect(page).to_not have_content(@airline3.name)
  #   end

  #   within "#flight-#{@flight2.id}" do
  #     expect(page).to have_content(@airline2.name)
  #     expect(page).to_not have_content(@airline3.name)
  #     expect(page).to_not have_content(@airline1.name)
  #   end

  #   within "#flight-#{@flight3.id}" do
  #     expect(page).to have_content(@airline3.name)
  #     expect(page).to_not have_content(@airline1.name)
  #     expect(page).to_not have_content(@airline2.name)
  #   end
  end
end