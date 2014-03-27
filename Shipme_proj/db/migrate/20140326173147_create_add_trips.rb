class CreateAddTrips < ActiveRecord::Migration
  def change
    create_table :add_trips do |t|
      t.string :Location
      t.string :Destination
      t.date :TravellingDate
      t.integer :MaximumWeight

      t.timestamps
    end
  end
end
