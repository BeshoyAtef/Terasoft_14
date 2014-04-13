class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.float :comission

      t.timestamps
    end
  end
end
