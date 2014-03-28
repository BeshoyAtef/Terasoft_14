class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :Reporter
      t.string :Reporting
      t.integer :PackageNo
      t.string :Report

      t.timestamps
    end
  end
end
