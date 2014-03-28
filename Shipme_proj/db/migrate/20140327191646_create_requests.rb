class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :userid
      t.integer :packageid
      t.boolean :accepted

      t.timestamps
    end
  end
end
