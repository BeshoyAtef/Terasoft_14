class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.date :expiryDate
      t.string :description
      t.string :destination
      t.string :origin
      t.string :receiverAddress
      t.integer :receiverMobNumber
      t.string :receiverEmail
      t.boolean :receivedByCarrier
      t.boolean :finalDelivery
      t.float :weight
      t.string :type
      t.float :carryingPrice
      t.float :packageValue
      t.float :rating
      t.belongs_to :senders
      t.belongs_to :carriers

      t.timestamps
    end
  end

  def self.down
    drop_table :packages
  end
end
