# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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