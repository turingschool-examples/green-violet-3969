require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe "relationships" do
    it { should have_many :passengers_flights }
    it {should have_many(:flights).through(:passengers_flights)}
  end
end