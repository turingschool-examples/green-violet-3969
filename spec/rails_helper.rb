def test_data
  @united = Airline.create!(name: "United Airlines")
  @alaska = Airline.create!(name: "Alaska Airlines")

  @flight1 = @united.flights.create!(number: 1, date: "08/03/20", departure_city: "Denver", arrival_city: "San Diego")
  @flight2 = @united.flights.create!(number: 2, date: "06/07/20", departure_city: "Liverpool", arrival_city: "New York")

  @flight3 = @alaska.flights.create!(number: 3, date: "05/10/20", departure_city: "Reno", arrival_city: "Seattle")
  @flight4 = @alaska.flights.create!(number: 4, date: "02/11/20", departure_city: "Grand Junction", arrival_city: "Denver")

  @pass1 = Passenger.create!(name: "Jim Bob", age: 25)
  @pass2 = Passenger.create!(name: "Tim Timothy", age: 47)
  @pass3 = Passenger.create!(name: "Bill Billson", age: 15)
  @pass4 = Passenger.create!(name: "Will Williamson", age: 39)

  FlightPassenger.create!(flight: @flight1, passenger: @pass1)

  FlightPassenger.create!(flight: @flight2, passenger: @pass1)
  FlightPassenger.create!(flight: @flight2, passenger: @pass2)

  FlightPassenger.create!(flight: @flight3, passenger: @pass3)

  FlightPassenger.create!(flight: @flight4, passenger: @pass3)
  FlightPassenger.create!(flight: @flight4, passenger: @pass4)
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
