require 'rails_helper'

RSpec.describe 'Airline Show', type: :feature do 
  before(:each) do 
    @frontier = Airline.create!(name: "Frontier")

    @flight1 = @frontier.flights.create!(number: 123, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @frontier.flights.create!(number: 111, date: "08/04/20", departure_city: "Denver", arrival_city: "Vegas")
    @flight3 = @frontier.flights.create!(number: 222, date: "08/05/20", departure_city: "Indy", arrival_city: "San Fran")

    @todd = Passenger.create!(name: "Todd", age: 40 )
    @amy = Passenger.create!(name: "Amy", age: 21 )

    @penny = Passenger.create!(name: "Penny", age: 8 )
    @vivian = Passenger.create!(name: "Vivian", age: 5 )

    @flight1.passengers << [@todd, @penny]
    @flight2.passengers << [@todd, @penny, @vivian, @amy]

end

describe "US3 Airline's Passengers" do
  it "I see a list of passengers that have flights on that airline And I see that this list is unique (no duplicate passengers)
  And I see that this list only includes adult passengers." do
  visit "/airlines/#{@frontier.id}"
save_and_open_page
    within("h1") do
      expect(page).to have_content("Airline Show Page")
    end

    within("h3") do
      expect(page).to have_content(@frontier.name)
    end

    within("h4") do
      expect(page).to have_content("Passenger List")
    end

    expect(page).to have_content(@todd.name).once
    expect(page).to have_content(@amy.name).once
    expect(page).to_not have_content(@penny.name)
    expect(page).to_not have_content(@vivian.name)
    end
  end
end