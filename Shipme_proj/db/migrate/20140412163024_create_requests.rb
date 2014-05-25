class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.boolean :accept
      t.belongs_to :carriers
      t.belongs_to :senders
      t.belongs_to :packages

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
