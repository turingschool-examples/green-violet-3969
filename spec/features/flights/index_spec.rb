require 'rails_helper'

RSpec.describe 'flight index page' do
  it 'displays all flight numbers and their airlines' do
    airline1 = Airline.create!(name: 'Southwest')
    airline2 = Airline.create!(name: 'Delta')
    airline3 = Airline.create!(name: 'United')
    flight1 = airline1.flights.create!(number: '1234', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
    flight2 = airline1.flights.create!(number: '5678', date: '08/05/20', departure_city: 'Chicago', arrival_city: 'Indy')
    flight3 = airline2.flights.create!(number: '9101', date: '08/07/20', departure_city: 'LA', arrival_city: 'Seattle')
    passenger1 = Passenger.create!(name: 'Joe', age: 7)
    passenger2 = Passenger.create!(name: 'Sally', age: 25)
    passenger3 = Passenger.create!(name: 'Fred', age: 45)
    passenger4 = Passenger.create!(name: 'Jill', age: 55)
    passenger5 = Passenger.create!(name: 'Jack', age: 65)
    FlightPassenger.create!(flight: flight1, passenger: passenger1)
    FlightPassenger.create!(flight: flight1, passenger: passenger2)
    FlightPassenger.create!(flight: flight2, passenger: passenger3)
    FlightPassenger.create!(flight: flight2, passenger: passenger4)
    FlightPassenger.create!(flight: flight3, passenger: passenger1)

    visit '/flights'

    expect(page).to have_content(flight1.number)
    expect(page).to have_content(airline1.name)
    expect(page).to have_content(passenger1.name)
  end

  it 'displays the names of all passengers on the flight' do
    expect(page).to have_content(passenger2.name)
    expect(page).to have_content(passenger3.name)
    expect(page).to have_content(passenger4.name)
  end

  
end