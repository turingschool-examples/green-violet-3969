# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@airline1 = Airline.create!(name: 'Frontier')
@airline2 = Airline.create!(name: 'United')
@flight1 = @airline1.flights.create!(number: '1727', date: '08/03/20', departure_city: 'Denver', arrival_city: 'Reno')
@flight2 = @airline1.flights.create!(number: '1827', date: '12/08/20', departure_city: 'Santa Fe', arrival_city: 'Portland')
@flight3 = @airline1.flights.create!(number: '1927', date: '08/19/20', departure_city: 'Denver', arrival_city: 'Portland')
@flight4 = @airline2.flights.create!(number: '2027', date: '05/02/20', departure_city: 'New York', arrival_city: 'Santa Barbara')
@flight5 = @airline2.flights.create!(number: '2127', date: '09/03/20', departure_city: 'Kansas City', arrival_city: 'San Francisco')
@passenger1 = Passenger.create!(name: 'Joe', age: 7)
@passenger2 = Passenger.create!(name: 'Sally', age: 25)
@passenger3 = Passenger.create!(name: 'Cory', age: 32)
@passenger4 = Passenger.create!(name: 'Mary', age: 12)
@passenger5 = Passenger.create!(name: 'Mike', age: 21)
@passenger6 = Passenger.create!(name: 'John', age: 65)
@passenger7 = Passenger.create!(name: 'Zack', age: 42)
@passenger8 = Passenger.create!(name: 'Jill', age: 13)
@flight_passenger1 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
@flight_passenger2 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
@flight_passenger3 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
@flight_passenger4 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger4.id)
@flight_passenger5 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger5.id)
@flight_passenger6 = FlightPassenger.create!(flight_id: @flight4.id, passenger_id: @passenger6.id)
@flight_passenger7 = FlightPassenger.create!(flight_id: @flight5.id, passenger_id: @passenger7.id)
@flight_passenger8 = FlightPassenger.create!(flight_id: @flight5.id, passenger_id: @passenger8.id)

