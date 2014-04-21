class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :destination
      t.string :location
      t.float :maxWeight
      t.date :travelDate
      t.belongs_to :users

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
