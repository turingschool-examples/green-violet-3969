require "rails_helper"

RSpec.describe "Airline Show Page", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit an airline's show page" do
    it "I see a unique list of adult passengers and no children" do
      visit(airline_path(@alaska))
      expect(page).to have_content(@pass1.name)
      expect(page).to have_content(@pass2.name)
      expect(page).to have_content(@pass4.name)
      expect(page).to_not have_content(@pass3.name)
    end
  end
end