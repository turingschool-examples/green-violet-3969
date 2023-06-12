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
          expect(page).to_not have_content(@pass3.name)
        end
      end
    end
    
    describe "Removing a passenger from a flight" do
      it "has a link to remove a passenger from a specific flight" do
        visit(flights_path)
        within "#flight_info_#{@flight1.id}" do
          expect(page).to have_link("Remove #{@pass1.name}")
          click_link("Remove #{@pass1.name}")
          expect(current_path).to eq(flights_path)
          expect(page).to_not have_content(@pass1.name)
        end
        within "#flight_info_#{@flight2.id}" do
          expect(page).to have_content(@pass1.name)
          expect(page).to have_link("Remove #{@pass1.name}")
        end
      end
    end
  end
end