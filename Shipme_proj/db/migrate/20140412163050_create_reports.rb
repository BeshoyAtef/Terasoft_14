class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :description
      t.boolean :verified
      t.integer :reporter_Id
      t.integer :reported_Id
      t.integer :package_Id

      t.timestamps
    end
  end
end
