require "rails_helper"

RSpec.describe Airline, type: :model do
  before(:each) do
    test_data
  end

  describe "relationships" do
    it {should have_many(:flights)}
    it {should have_many(:flight_passengers).through(:flights)}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe "Instance Methods" do
    describe "#adult_passengers" do
      it "can find all passengers for an airline above the age 18" do
        expect(@united.adult_passengers).to eq([@pass1, @pass2])
        expect(@alaska.adult_passengers).to eq([@pass1, @pass2, @pass4])
      end
    end
  end
end
