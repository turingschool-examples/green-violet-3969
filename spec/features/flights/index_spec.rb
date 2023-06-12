require "rails_helper"

RSpec.describe "flights index" do
  before :each do
    @sw = Airline.create!(name: "Southwest")
    @delta = Airline.create!(name: "Delta")
    @spirit = Airline.create!(name: "Spirit")

    @denver = @sw.flights.create!(number: "100", date: "06/13/23", departure_city: "Houston", arrival_city: "Denver")
    @houston = @sw.flights.create!(number: "200", date: "06/14/23", departure_city: "Denver", arrival_city: "Houston")
    @chicago = @delta.flights.create!(number: "300", date: "06/15/23", departure_city: "New York", arrival_city: "Chicago")
    @new_york = @delta.flights.create!(number: "400", date: "06/16/23", departure_city: "Chicago", arrival_city: "New York")
    @toronto = @spirit.flights.create!(number: "500", date: "06/17/23", departure_city: "Toronto", arrival_city: "Dallas")
    @dallas = @spirit.flights.create!(number: "600", date: "06/18/23", departure_city: "Dallas", arrival_city: "Toronto")

    @abe = Passenger.create!(name: "Abe", age: 40)
    @bob = Passenger.create!(name: "Bob", age: 50)
    @bill = Passenger.create!(name: "Bill", age: 60)
    @joe = Passenger.create!(name: "Joe", age: 20)
    @jill = Passenger.create!(name: "Jill", age: 30)
    @sam = Passenger.create!(name: "Sam", age: 10)


    @fp1 = FlightPassenger.create!(flight: @denver, passenger: @abe)
    @fp2 = FlightPassenger.create!(flight: @houston, passenger: @bob)
    @fp3 = FlightPassenger.create!(flight: @chicago, passenger: @bill)
    @fp4 = FlightPassenger.create!(flight: @new_york, passenger: @joe)
    @fp5 = FlightPassenger.create!(flight: @toronto, passenger: @jill)
    @fp6 = FlightPassenger.create!(flight: @dallas, passenger: @sam)
    
    # require 'pry'; binding.pry

    
    # visit flights_path
  end

  # it "can see a list of all the names of my items and not items for other merchants" do
  #   expect(page).to have_content(@item_1.name)
  #   expect(page).to have_content(@item_2.name)
  #   expect(page).to have_content(@item_3.name)
  #   expect(page).to have_content(@item_4.name)

  #   expect(page).to have_no_content(@item_5.name)
  #   expect(page).to have_no_content(@item_6.name)
  # end

  # it "shows the bachelorette's information" do
  #   visit bachelorette_path(@bachelorette1)

  #   within(".bachelorette_header") do
  #     expect(page).to have_content(@bachelorette1.name)
  #     expect(page).to have_content(@bachelorette1.season_number)
  #     expect(page).to have_content("Description: A crazy season!")
  #     expect(page).to_not have_content(@bachelorette2.name)
      
  #     click_link "Contestants"
  #   end

  #     expect(current_path).to eq(bachelorette_path(@bachelorette1))
  # end


end