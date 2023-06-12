require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before :each do
    @airline1 = Airline.create!(name: "Fly-A-Ways")
    @airline2 = Airline.create!(name: "Rocky Mountain Magic Carpets")

    @flight1 = @airline1.flights.create!(number: "1492", date: "04/13/2023", departure_city: "Laramie", arrival_city: "Las Vegas")
    @flight2 = @airline1.flights.create!(number: "1776", date: "07/04/1776", departure_city: "Philadelphia", arrival_city: "Washington D.C.")
    @flight3 = @airline1.flights.create!(number: "9999", date: "09/19/1999", departure_city: "New York City", arrival_city: "Los Angeles")
    @flight4 = @airline2.flights.create!(number: "1111", date: "09/17/2022", departure_city: "Steamboat Springs", arrival_city: "Pagosa Springs")
    @flight5 = @airline2.flights.create!(number: "1903", date: "12/17/1903", departure_city: "Kill Devil Hills", arrival_city: "Kitty Hawk")
    @flight6 = @airline2.flights.create!(number: "7777", date: "12/01/1920", departure_city: "Harbour Grace", arrival_city: "Northern Ireland")

    @passenger1  = Passenger.create!(name: "Billy Bob", age: 55)
    @passenger2  = Passenger.create!(name: "Silly Bob", age: 65)
    @passenger3  = Passenger.create!(name: "Andy", age: 35)
    @passenger4  = Passenger.create!(name: "Cleatis", age: 35)
    @passenger5  = Passenger.create!(name: "Moe", age: 76)
    @passenger6  = Passenger.create!(name: "Larry", age: 77)
    @passenger7  = Passenger.create!(name: "Curly", age: 78)
    @passenger8  = Passenger.create!(name: "Shemp", age: 75)
    @passenger9  = Passenger.create!(name: "Orville", age: 65)
    @passenger10 = Passenger.create!(name: "Wilbur", age: 65)
    @passenger11 = Passenger.create!(name: "Amelia", age: 65)
    @passenger12 = Passenger.create!(name: "Wanda", age: 6)

    @booking1 = Booking.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
    @booking2 = Booking.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
    @booking3 = Booking.create!(passenger_id: @passenger3.id, flight_id: @flight2.id)
    @booking4 = Booking.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
    @booking5 = Booking.create!(passenger_id: @passenger5.id, flight_id: @flight3.id)
    @booking6 = Booking.create!(passenger_id: @passenger6.id, flight_id: @flight3.id)
    @booking7 = Booking.create!(passenger_id: @passenger7.id, flight_id: @flight4.id)
    @booking8 = Booking.create!(passenger_id: @passenger8.id, flight_id: @flight4.id)
    @booking9 = Booking.create!(passenger_id: @passenger9.id, flight_id: @flight5.id)
    @booking10 = Booking.create!(passenger_id: @passenger10.id, flight_id: @flight5.id)
    @booking11 = Booking.create!(passenger_id: @passenger11.id, flight_id: @flight6.id)
    @booking12 = Booking.create!(passenger_id: @passenger12.id, flight_id: @flight6.id)

    @booking13 = Booking.create!(passenger_id: @passenger4.id, flight_id: @flight1.id)
  end

  describe "flights index" do
    it "shows all flight numbers assciated with airline and passengers" do
      # User Story 1, Flights Index Page
      visit "/flights"

      within "#flights" do
        expect(page).to have_content("Flight: ##{@flight1.number} - Airline: #{@airline1.name}")
        expect(page).to have_content("Passenger: #{@passenger1.name}")
        expect(page).to have_content("Passenger: #{@passenger2.name}")
        expect(@flight1.number).to appear_before(@flight2.number)

        expect(page).to have_content("Flight: ##{@flight2.number} - Airline: #{@airline1.name}")
        expect(page).to have_content("Passenger: #{@passenger3.name}")
        expect(page).to have_content("Passenger: #{@passenger4.name}")
        expect(@flight2.number).to appear_before(@flight3.number)

        expect(page).to have_content("Flight: ##{@flight3.number} - Airline: #{@airline1.name}")
        expect(page).to have_content("Passenger: #{@passenger5.name}")
        expect(page).to have_content("Passenger: #{@passenger6.name}")
        expect(@flight3.number).to appear_before(@flight4.number)

        expect(page).to have_content("Flight: ##{@flight4.number} - Airline: #{@airline2.name}")
        expect(page).to have_content("Passenger: #{@passenger7.name}")
        expect(page).to have_content("Passenger: #{@passenger8.name}")
        expect(@flight4.number).to appear_before(@flight5.number)

        expect(page).to have_content("Flight: ##{@flight5.number} - Airline: #{@airline2.name}")
        expect(page).to have_content("Passenger: #{@passenger9.name}")
        expect(page).to have_content("Passenger: #{@passenger10.name}")
        expect(@flight5.number).to appear_before(@flight6.number)

        expect(page).to have_content("Flight: ##{@flight6.number} - Airline: #{@airline2.name}")
        expect(page).to have_content("Passenger: #{@passenger11.name}")
        expect(page).to have_content("Passenger: #{@passenger12.name}")
      end
    end

    it "removes passenger from flight" do
      # User Story 2, Remove a Passenger from a Flight
      visit "/flights"

      within "#flights" do
        expect(@flight1.passengers).to eq([@passenger1, @passenger2, @passenger4])
        expect(@flight2.passengers).to eq([@passenger3, @passenger4])
        expect(page).to have_button "Remove Passenger #{@passenger4.name} From Flight ##{@flight2.number}"
        click_button "Remove Passenger #{@passenger4.name} From Flight ##{@flight2.number}"
        expect(current_path).to eq("/flights")
        @flight2.reload
      end

      within "#flights" do
        expect(@flight2.passengers).to eq([@passenger3])
        expect(@flight1.passengers).to eq([@passenger1, @passenger2, @passenger4])
      end
    end
  end
end