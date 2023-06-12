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

    within("h1")do
      expect(page).to have_content("Flights Index Page")
    end
    
    within("#flight-info-#{@flight1.id}") do
      expect(page).to have_content("Airline: #{@frontier.name}")
      expect(page).to have_content("Flight Number: #{@flight1.number}")
      expect(page).to have_content("Passenger Name: #{@todd.name}")
      expect(page).to have_content("Passenger Name: #{@penny.name}")
      expect(page).to_not have_content(@vivian.name)
    end

    within("#flight-info-#{@flight2.id}") do
      expect(page).to have_content("Airline: #{@frontier.name}")
      expect(page).to have_content("Flight Number: #{@flight2.number}")
      expect(page).to have_content("Passenger Name: #{@todd.name}")
      expect(page).to have_content("Passenger Name: #{@penny.name}")
      expect(page).to have_content("Passenger Name: #{@vivian.name}")
    end

    within("#flight-info-#{@flight3.id}") do
      expect(page).to have_content("Airline: #{@frontier.name}")
      expect(page).to have_content("Flight Number: #{@flight3.number}")
      expect(page).to_not have_content("Passenger Name: #{@todd.name}")
      expect(page).to_not have_content("Passenger Name: #{@penny.name}")
      expect(page).to_not have_content("Passenger Name: #{@vivian.name}")
    end
  end
  
  describe "US2  Remove a Passenger from a Flight" do
    it "When I visit the flights index page Next to each passengers name I see a link or button to remove that passenger from that flight
    When I click on that link/button I'm returned to the flights index page And I no longer see that passenger listed under that flight,
    And I still see the passenger listed under the other flights they were assigned to." do
    visit "/flights"
    
    within("#flight-info-#{@flight1.id}") do
      # within("#passenger-#{@penny.id}") do
        expect(page).to have_content(@penny.name)
        expect(page).to have_button("Delete #{@penny.name}")
        click_button("Delete #{@penny.name}")
        expect(current_path).to eq("/flights")
        expect(page).to_not have_content(@penny.name)
        expect(page).to have_content(@todd.name)
    # end
  end

      within("#flight-info-#{@flight2.id}") do
        expect(page).to have_content(@penny.name)
        expect(page).to have_content(@todd.name)
        expect(page).to have_content(@vivian.name)
        end
      end
    end
  end
end