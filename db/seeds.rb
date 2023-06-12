# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    delta = Airline.create!(name: "Delta")
    sw = Airline.create!(name: "South West")

    flight_1 = Flight.create!(number: 2540, date: "08/02/20", departure_city: "Denver", arrival_city: "Reno", airline: sw)
    flight_2 = Flight.create!(number: 1232, date: "08/03/20", departure_city: "Denver", arrival_city: "Jackson", airline: sw)
    flight_3 = Flight.create!(number: 1232, date: "08/03/20", departure_city: "Denver", arrival_city: "Jackson", airline: delta)

    passenger_1 = Passenger.create!(name: "Ben", age: 32)
    passenger_2 = Passenger.create!(name: "Molly", age: 21)
    passenger_3 = Passenger.create!(name: "Steve", age: 45)
    passenger_4 = Passenger.create!(name: "Erin", age: 30)
    passenger_5 = Passenger.create!(name: "Alex", age: 12)
    passenger_6 = Passenger.create!(name: "Dan", age:34)



    pf1 = PassengerFlight.create!(passenger: passenger_1, flight: flight_1)
    pf2 = PassengerFlight.create!(passenger: passenger_2, flight: flight_1)
    pf3 = PassengerFlight.create!(passenger: passenger_3, flight: flight_2)
    pf4 = PassengerFlight.create!(passenger: passenger_4, flight: flight_2)
    pf5 = PassengerFlight.create!(passenger: passenger_1, flight: flight_2)
    pf6 = PassengerFlight.create!(passenger: passenger_3, flight: flight_2)
    pf7 = PassengerFlight.create!(passenger: passenger_5, flight: flight_1)
    pf8 = PassengerFlight.create!(passenger: passenger_6, flight: flight_3)
