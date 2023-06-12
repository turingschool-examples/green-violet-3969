require 'rails_helper'

RSpec.describe 'airline show page' do
  it 'displays unique list of adult passengers who have flights on this airline' do
    airline1 = Airline.create!(name: 'Southwest')
    flight1 = airline1.flights.create!(number: '1234', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
    flight2 = airline1.flights.create!(number: '5678', date: '08/05/20', departure_city: 'Chicago', arrival_city: 'Indy')
    flight3 = airline1.flights.create!(number: '9101', date: '08/07/20', departure_city: 'LA', arrival_city: 'Seattle')
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

    visit "/airlines/#{airline1.id}"
    
    expect(page).to have_content('List of all adult passengers who have flights on this airline')
    expect(page).to have_content("#{passenger2.name}", count: 1)
    expect(page).to have_content("#{passenger4.name}", count: 1)
    expect(page).to_not have_content("#{passenger1.name}")
  end
end