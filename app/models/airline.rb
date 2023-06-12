class Airline < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :passengers, through: :flights

  def adult_passengers
    passengers.where("age >= 18").distinct
  end
end
