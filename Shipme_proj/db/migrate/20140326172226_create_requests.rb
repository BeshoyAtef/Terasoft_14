class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.Integer :package_id
      t.Integer :sender_id
      t.Integer :carrier_id
      t.Boolean :accepted

      t.timestamps
    end
  end
end
