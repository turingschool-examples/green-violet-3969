# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    @airline = Airline.create!(name: 'United')
    @flight_1 = Flight.create!(number: '1234', date: '06/12/23', departure_city: 'Denver', arrival_city: 'Miami', airline: @airline)
    @flight_2 = Flight.create!(number: '1727', date: '08/03/23', departure_city: 'Denver', arrival_city: 'Reno', airline: @airline)
    @flight_3 = Flight.create!(number: '4568', date: '06/12/23', departure_city: 'Denver', arrival_city: 'San Francisco', airline: @airline)
    @passenger_1 = Passenger.create!(name: 'Joe', age: 7)
    @passenger_2 = Passenger.create!(name: 'Ann', age: 43)
    @passenger_3 = Passenger.create!(name: 'Jess', age: 76)
    @passenger_4 = Passenger.create!(name: 'Wesley', age: 24)

    PassengerFlight.create!(flight: @flight_1, passenger: @passenger_1)
    PassengerFlight.create!(flight: @flight_2, passenger: @passenger_2)
    PassengerFlight.create!(flight: @flight_3, passenger: @passenger_3)
    PassengerFlight.create!(flight: @flight_3, passenger: @passenger_4) 