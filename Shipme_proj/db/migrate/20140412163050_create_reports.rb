class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string :description
      t.boolean :verified
      t.belongs_to :reporters
      t.belongs_to :reported
      t.belongs_to :packages

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
