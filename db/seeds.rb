# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    airline1 = Airline.create!(name: "SW")

    flight1 = Flight.create!(number: 1, date: "08112023", departure_city: "reno", arrival_city: "las vegas", airline_id: airline1.id)
    flight2 = Flight.create!(number: 2, date: "08112023", departure_city: "reno", arrival_city: "denver", airline_id: airline1.id)
    flight3 = Flight.create!(number: 3, date: "08/11/2023", departure_city: "reno", arrival_city: "dallas", airline_id: airline1.id)

    passenger1 = Passenger.create!(name: "Niki", age: 31)
    passenger2 = Passenger.create!(name: "Robert", age: 33)
    passenger3 = Passenger.create!(name: "Felicia", age: 31)
    passenger4 = Passenger.create!(name: "Charles", age: 32)

    FlightPassenger.create!(flight: flight1, passenger: passenger1)
    FlightPassenger.create!(flight: flight1, passenger: passenger2)
    FlightPassenger.create!(flight: flight1, passenger: passenger3)
    FlightPassenger.create!(flight: flight2, passenger: passenger3)
    FlightPassenger.create!(flight: flight2, passenger: passenger4)