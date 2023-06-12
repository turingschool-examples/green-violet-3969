require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "relationships" do
    it {should belong_to :airline}
    it { should have_many :passengers_flights }
    it { should have_many(:passengers).through(:passengers_flights)}

  end
end
