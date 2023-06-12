class CreateJoinTableFlightsPassengers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :flights, :passengers
  end
end

