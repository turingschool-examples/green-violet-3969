require "rails_helper"

RSpec.describe "the flights index page" do
# User Story 1, Flights Index Page
  it "displays flight numbers, airline name, and passengers on that flight" do 
    @airline1 = Airline.create!(name: "Southwest")
    @airline2 = Airline.create!(name: "Delta")
    @flight1 = @airline1.flights.create!(number: "1727", date: "08/03/23", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline1.flights.create!(number: "3937", date: "09/04/23", departure_city: "Denver", arrival_city: "Seattle")
    @flight3 = @airline1.flights.create!(number: "6493", date: "08/02/23", departure_city: "Reno", arrival_city: "Denver")
    @flight4 = @airline1.flights.create!(number: "3476", date: "07/01/23", departure_city: "Seattle", arrival_city: "Denver")
    @flight5 = @airline2.flights.create!(number: "2031", date: "08/03/23", departure_city: "Denver", arrival_city: "Portland")
    @passenger1 = @flight1.passengers.create!(name: "Jolene", age: "18")
    @passenger2 = @flight1.passengers.create!(name: "Simon", age: "3")
    @passenger3 = @flight1.passengers.create!(name: "Brett", age: "38")
    @passenger4 = @flight1.passengers.create!(name: "Jana", age: "37")
    @passenger5 = @flight2.passengers.create!(name: "Stephanie", age: "30")
    @passenger6 = @flight2.passengers.create!(name: "Lauren", age: "8")
    @passenger7 = @flight2.passengers.create!(name: "Joey", age: "55")
    @passenger8 = @flight3.passengers.create!(name: "Mike", age: "31")
    @passenger9 = @flight4.passengers.create!(name: "Teresa", age: "65")
    @passenger10 = @flight5.passengers.create!(name: "Eric", age: "22")

    visit "/fights"

    expect(page).to have_content("#{@flight1.number} #{@airline1.name}")
    expect(page).to have_content("#{@flight2.number} #{@airline1.name}")
    expect(page).to have_content("#{@flight3.number} #{@airline1.name}")
    expect(page).to have_content("#{@flight4.number} #{@airline1.name}")
    expect(page).to have_content("#{@flight5.number} #{@airline2.name}")

    within "#{@flight1.number}" do
      expect(page).to have_content("#{@passenger1.name}")
      expect(page).to have_content("#{@passenger2.name}")
      expect(page).to have_content("#{@passenger3.name}")
      expect(page).to have_content("#{@passenger4.name}")
    end

    within "#{@flight2.number}" do
      expect(page).to have_content("#{@passenger5.name}")
      expect(page).to have_content("#{@passenger6.name}")
      expect(page).to have_content("#{@passenger7.name}")
    end

    within "#{@flight3.number}" do
      expect(page).to have_content("#{@passenger8.name}")
    end

    within "#{@flight4.number}" do
      expect(page).to have_content("#{@passenger9.name}")
    end

    within "#{@flight5.number}" do
      expect(page).to have_content("#{@passenger10.name}")
    end
  end
end