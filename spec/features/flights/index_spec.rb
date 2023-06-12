require "rails_helper"

RSpec.describe "flights index" do
  before(:each) do
    @airline_1 = Airline.create!(name: "BlueJet")
    @airline_2 = Airline.create!(name: "Atled")
    @flight_1 = @airline_1.flights.create!(number: 1234, date: "07/03/23", departure_city: "LA", arrival_city: "Reno")
    @flight_2 = @airline_2.flights.create!(number: 1254, date: "07/03/23", departure_city: "SF", arrival_city: "Seatle")
    @passenger_1 = @flight_1.passengers.create!(name: "Bob", age: 26)
    @passenger_2 = @flight_1.passengers.create!(name: "Bill", age: 30)
    @passenger_3 = @flight_1.passengers.create!(name: "Joe", age: 40)
    @passenger_4 = @flight_1.passengers.create!(name: "Frank", age: 60)
    @passenger_5 = @flight_2.passengers.create!(name: "George", age: 23)
    @passenger_6 = @flight_2.passengers.create!(name: "Jake", age: 32)
    @passenger_7 = @flight_2.passengers.create!(name: "Aaron", age: 45)
    @passenger_8 = @flight_2.passengers.create!(name: "Derek", age: 50)
    @passenger_1 = @flight_2.passengers.create!(name: "Bob", age: 26)

  end
  it "can display flights" do
    visit "/flights"
    expect(page).to have_content("Flight number: 1234")
    expect(page).to have_content("Airline name: BlueJet")
    expect(page).to have_content("Flight 1234 Passengers:")
    expect(page).to have_content("Bob")
    expect(page).to have_content("Bill")
    expect(page).to have_content("Joe")
    expect(page).to have_content("Frank")
    expect(page).to have_content("Flight number: 1254")
    expect(page).to have_content("Airline name: Atled")
    expect(page).to have_content("Flight 1254 Passengers:")
    expect(page).to have_content("George")
    expect(page).to have_content("Jake")
    expect(page).to have_content("Aaron")
    expect(page).to have_content("Derek")
  end

  it "can remove passenger from flight" do
    visit "/flights"
    expect(page).to have_content("Flight 1234 Passengers:")
    expect(page).to have_content("Bob")
    expect(page).to have_content("Bill")
    expect(page).to have_content("Joe")
    expect(page).to have_content("Frank")
    click_button "Remove Bob"
    expect(current_path).to eq("/flights")
    expect(page).to have_content("Flight 1234 Passengers:")
    expect(page).to have_content("Bill")
    expect(page).to have_content("Joe")
    expect(page).to have_content("Frank")
    expect(page).to_not have_content("Bob")

    expect(page).to have_content("Flight 1254 Passengers:")
    expect(page).to have_content("Bob")
      
  end

end
