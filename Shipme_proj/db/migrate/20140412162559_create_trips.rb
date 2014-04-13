class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.string :location
      t.float :maxWeight
      t.date :travelDate
      t.integer :user_Id

      t.timestamps
    end
  end
end
