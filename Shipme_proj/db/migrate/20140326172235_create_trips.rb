class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.String :my_destination
      t.String :my_location
      t.String :max_weight
      t.Date :travel_date

      t.timestamps
    end
  end
end
