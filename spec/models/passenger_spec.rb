require "rails_helper" 

RSpec.describe Passenger do 
  describe "relationships" do 
    it { should have_many(:flights).through(:passenger_flights) }
  end

  describe "instance methods" do 
    it "#adult?" do 
      @pass_1 = Passenger.create!(name: "Ricky", age: 24)
      @pass_2 = Passenger.create!(name: "Randy", age: 2)
      @pass_3 = Passenger.create!(name: "Lahey", age: 40)

      expect(@pass_1.adult?).to eq(true)
      expect(@pass_2.adult?).to eq(false)
      expect(@pass_3.adult?).to eq(true)
    end
  end
end