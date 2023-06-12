require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it {should have_many :flights}
  end
  describe 'instance methods' do
    it "#adult_passengers" do 
      @airline1 = Airline.create!(name: "Southwest")
      @airline2 = Airline.create!(name: "Delta")
      @flight1 = @airline1.flights.create!(number: "1727", date: "08/03/23", departure_city: "Denver", arrival_city: "Reno")
      @flight2 = @airline1.flights.create!(number: "3937", date: "09/04/23", departure_city: "Denver", arrival_city: "Seattle")
      @flight3 = @airline2.flights.create!(number: "6493", date: "08/02/23", departure_city: "Reno", arrival_city: "Denver")
      @passenger1 = @flight1.passengers.create!(name: "Jolene", age: "18")
      @passenger2 = @flight1.passengers.create!(name: "Simon", age: "3")
      @passenger3 = @flight1.passengers.create!(name: "Brett", age: "38")
      @passenger5 = @flight2.passengers.create!(name: "Stephanie", age: "30")
      @passenger6 = @flight2.passengers.create!(name: "Lauren", age: "8")
      @passenger7 = @flight2.passengers.create!(name: "Joey", age: "55")
      @passenger8 = @flight3.passengers.create!(name: "Mike", age: "31")

      expect(@airline1.adult_passengers).to eq([@passenger1, @passenger3, @passenger5, @passenger7])
      expect(@airline2.adult_passengers).to eq([@passenger8])
    end
  end
end
