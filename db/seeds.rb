# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@airline1 = Airline.create!(name: "Southwest")
@airline2 = Airline.create!(name: "Spirit")

@flight1 = Flight.create!(number: "0420", date: "06/24/2023", departure_city: "Dulles", arrival_city: "Denver", airline_id: @airline1.id)
@flight2 = Flight.create!(number: "6969", date: "06/24/2023", departure_city: "DC", arrival_city: "Richmond", airline_id: @airline1.id)
@flight3 = Flight.create!(number: "2121", date: "06/24/2023", departure_city: "Atlanta", arrival_city: "Broomfield", airline_id: @airline2.id)

@passenger1 = Passenger.create!(name: "Ace Ventura", age: 35, flight_id: @flight1.id)
@passenger2 = Passenger.create!(name: "Tom Hanks", age: 70, flight_id: @flight1.id)
@passenger3 = Passenger.create!(name: "Lisa Leslie", age: 45, flight_id: @flight2.id)
@passenger4 = Passenger.create!(name: "Dan Rather", age: 75, flight_id: @flight2.id)
@passenger5 = Passenger.create!(name: "Vin Diesel", age: 48, flight_id: @flight3.id)