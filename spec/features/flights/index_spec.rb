require 'rails_helper'

RSpec.describe 'flight index', type: :feature do 
  before(:each) do 
    @frontier = Airline.create!(name: "Frontier")

    @flight1 = @frontier.flights.create!(number: 123, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @frontier.flights.create!(number: 111, date: "08/04/20", departure_city: "Denver", arrival_city: "Vegas")
    @flight3 = @frontier.flights.create!(number: 222, date: "08/05/20", departure_city: "Indy", arrival_city: "San Fran")

    @todd = Passenger.create!(name: "Todd", age: 40 )
    @penny = Passenger.create!(name: "Penny", age: 8 )
    @vivian = Passenger.create!(name: "Vivian", age: 5 )

    @flight1.passengers << [@todd, @penny]
    @flight2.passengers << [@todd, @penny, @vivian]

end

  describe "US1 Flights Index Page '/flights'" do
    it "I see a list of all flight numbers And next to each flight number I see the name of the Airline of that flight
    And under each flight number I see the names of all that flight's passengers" do
    visit "/flights"
save_and_open_page

    within("#flight-info-#{@flight1.id}") do
      expect(page).to have_content("Frontier")
      expect(page).to have_content(123)
      expect(page).to have_content(@todd.name)
      expect(page).to have_content(@penny.name)
      end
    end
  end
end