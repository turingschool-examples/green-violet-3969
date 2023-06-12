# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PassengerFlight.destroy_all
Passenger.destroy_all
Flight.destroy_all
Airline.destroy_all

@airline1 = Airline.create!(name: "I Believe I Can Fly")
@airline2 = Airline.create!(name: "Glide Like a Turkey Air")

@flight1 = @airline1.flights.create!(number: "2984", date: "09/07/22", departure_city: "Phoenix", arrival_city: "Denver")
@flight2 = @airline1.flights.create!(number: "3484", date: "09/07/22", departure_city: "Los Angeles", arrival_city: "Sacremento")
@flight3 = @airline1.flights.create!(number: "9376", date: "09/10/22", departure_city: "New Orleans", arrival_city: "Memphis")
@flight4 = @airline1.flights.create!(number: "9376", date: "06/09/22", departure_city: "Chicago", arrival_city: "New York City")

@flight5 = @airline2.flights.create!(number: "9309", date: "09/23/23", departure_city: "Salt Lake City", arrival_city: "Seattle")
@flight6 = @airline2.flights.create!(number: "9765", date: "09/28/22", departure_city: "Denver", arrival_city: "Chicago")

@passenger1 = Passenger.create!(name: "Wolfie", age: 2)
@passenger2 = Passenger.create!(name: "Maggie", age: 7)
@passenger3 = Passenger.create!(name: "Circe", age: 3)
@passenger4 = Passenger.create!(name: "K.D.", age: 37)
@passenger5 = Passenger.create!(name: "Bob", age: 38)

@pass_flight1 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight1.id)
@pass_flight2 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight1.id)
@pass_flight3 = PassengerFlight.create!(passenger_id: @passenger3.id, flight_id: @flight1.id)
@pass_flight4 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight2.id)
@pass_flight5 = PassengerFlight.create!(passenger_id: @passenger1.id, flight_id: @flight3.id)
@pass_flight6 = PassengerFlight.create!(passenger_id: @passenger2.id, flight_id: @flight2.id)
@pass_flight6 = PassengerFlight.create!(passenger_id: @passenger4.id, flight_id: @flight2.id)
@pass_flight6 = PassengerFlight.create!(passenger_id: @passenger4.id, flight_id: @flight1.id)
@pass_flight6 = PassengerFlight.create!(passenger_id: @passenger5.id, flight_id: @flight1.id)
@pass_flight6 = PassengerFlight.create!(passenger_id: @passenger5.id, flight_id: @flight2.id)