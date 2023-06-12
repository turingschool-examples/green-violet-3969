require "rails_helper" 

RSpec.describe "Flights Index Page", type: :feature do 
  before(:each) do 
    @airline1 = Airline.create!(name: "I Believe I Can Fly")
@airline2 = Airline.create!(name: "Glide Like a Turkey Air")

@flight1 = @airline1.flights.create!(number: "2984", date: "09/07/22", departure_city: "Phoenix", arrival_city: "Denver")
@flight2 = @airline1.flights.create!(number: "3484", date: "09/07/22", departure_city: "Los Angeles", arrival_city: "Sacremento")
@flight3 = @airline1.flights.create!(number: "9376", date: "09/10/22", departure_city: "New Orleans", arrival_city: "Memphis")
@flight4 = @airline1.flights.create!(number: "9376", date: "06/09/22", departure_city: "Chicago", arrival_city: "New York City")
  end
end