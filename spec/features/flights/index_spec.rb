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
    
    visit flights_path
  end

  it "can see a list of all the names of my items and not items for other merchants" do
    within(".flight_lists") do 
      expect(page).to have_content(@denver.number)
      expect(page).to have_content(@sw.name)
      expect(page).to have_content(@abe.name)
      expect(page).to have_content(@houston.number)
      expect(page).to have_content(@bob.name)

      expect(page).to have_content(@chicago.number)
      expect(page).to have_content(@delta.name)
      expect(page).to have_content(@bill.name)
      expect(page).to have_content(@new_york.number)
      expect(page).to have_content(@joe.name)

      expect(page).to have_content(@toronto.number)
      expect(page).to have_content(@spirit.name)
      expect(page).to have_content(@jill.name)
      expect(page).to have_content(@dallas.number)
      expect(page).to have_content(@sam.name)
    end
  end

  it "displays a button next to each passenger to remove the passenger from the flight" do
    @sue = Passenger.create!(name: "Sue", age: 50)
    @fp7 = FlightPassenger.create!(flight: @dallas, passenger: @sue)
    @fp8 = FlightPassenger.create!(flight: @toronto, passenger: @sue)
    
    within ".flight_lists" do
      expect(page).to have_button("Remove #{@abe.name}")
      expect(page).to have_button("Remove #{@bob.name}")
      expect(page).to have_button("Remove #{@bill.name}")
      expect(page).to have_button("Remove #{@joe.name}")
      expect(page).to have_button("Remove #{@jill.name}")
      expect(page).to have_button("Remove #{@sam.name}")
      click_button("Remove #{@abe.name}")
    end

    expect(current_path).to eq(flights_path)

    within ".flight_lists" do
      expect(page).to_not have_content(@abe.name)
      expect(page).to_not have_button("Remove #{@abe.name}")  
    end
  end

end