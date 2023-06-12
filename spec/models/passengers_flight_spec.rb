require 'rails_helper'

RSpec.describe PassengersFlight, type: :model do
  describe "relationships" do
    it { belong_to :flight}
    it { belong_to :passenger}
  end
end
