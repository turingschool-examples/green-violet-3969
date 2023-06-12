require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it {should have_many PassengerFlights}
  end
end