require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it { should have_many :flight_passengers }
  it { should have_many(:flights).through(:flight_passengers)}

  describe '.adult' do
    it 'returns adult passengers with age greater than or equal to 18' do
      adult_passenger = Passenger.create(name: 'John Doe', age: 25)
      child_passenger = Passenger.create(name: 'Jane Doe', age: 12)

      adult_passengers = Passenger.adult

      expect(adult_passengers).to include(adult_passenger)
      expect(adult_passengers).not_to include(child_passenger)
    end
  end
end
