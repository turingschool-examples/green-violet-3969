class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :number
      t.string :date
      t.string :departure_city
      t.string :arrival_city
      t.references :airline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
