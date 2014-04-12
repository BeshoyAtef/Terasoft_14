class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :accept
      t.integer :carrier_Id
      t.integer :sender_Id

      t.timestamps
    end
  end
end
