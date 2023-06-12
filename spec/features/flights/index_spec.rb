require "rails_helper"

RSpec.describe "Flights Index Page", type: :feature do
  before(:each) do
    test_data
  end

  describe "Flights Index Page " do
    describe "Shows flight details" do
      it "displays flight numbers, airlines, and passengers on flight" do
        visit(flights_path)
        within "#flight_info_#{@flight2.id}" do
          expect(page).to have_content("Flight Number: #{@flight2.number}")
          expect(page).to have_content("Airline: #{@flight2.airline.name}")
          expect(page).to have_content("Passengers:")
          expect(page).to have_content(@pass1.name)
          expect(page).to have_content(@pass2.name)
        end
      end
    end
  end
end