# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
frontier = Airline.create!(name: "Frontier")
flight1 = frontier.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
flight2 = frontier.flights.create!(number: "1370", date: "08/07/20", departure_city: "Reno", arrival_city: "San Francisco")

southwest = Airline.create!(name: "Southwest")
flight3 = southwest.flights.create!(number: "2799", date: "07/31/20", departure_city: "San Francisco", arrival_city: "Reno")

passenger1 = Passenger.create!(name: "Joe", age: 7)
passenger2 = Passenger.create!(name: "Michael", age: 32)
passenger3 = Passenger.create!(name: "Ashley", age: 27)
passenger4 = Passenger.create!(name: "Taylor", age: 18)

fp1 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger1.id)
fp2 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger2.id)
fp3 = FlightPassenger.create!(flight_id: flight1.id, passenger_id: passenger3.id)
fp4 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger3.id)
fp5 = FlightPassenger.create!(flight_id: flight2.id, passenger_id: passenger4.id)
fp6 = FlightPassenger.create!(flight_id: flight3.id, passenger_id: passenger4.id)