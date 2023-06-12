require "rails_helper"

RSpec.describe Airline, type: :model do
  before(:each) do 
    @frontier = Airline.create!(name: "Frontier")

    @flight1 = @frontier.flights.create!(number: 123, date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @frontier.flights.create!(number: 111, date: "08/04/20", departure_city: "Denver", arrival_city: "Vegas")
    @flight3 = @frontier.flights.create!(number: 222, date: "08/05/20", departure_city: "Indy", arrival_city: "San Fran")

    @todd = Passenger.create!(name: "Todd", age: 40 )
    @amy = Passenger.create!(name: "Amy", age: 21 )

    @penny = Passenger.create!(name: "Penny", age: 8 )
    @vivian = Passenger.create!(name: "Vivian", age: 5 )

    @flight1.passengers << [@todd, @penny]
    @flight2.passengers << [@todd, @penny, @vivian, @amy]

end
  describe "relationships" do
    it {should have_many :flights}
    it {should have_many(:passenger_flights).through(:flights)}
    it {should have_many(:passengers).through(:passenger_flights)}
  end

  describe "US lists unique name of adults" do
    it "::unique_adults" do
      expect(@frontier.unique_adults).to eq([@todd, @amy])
    end
  end
end
