class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.string :location
      t.integer :maxweight
      t.date :depdate

      t.timestamps
    end
  end
end
