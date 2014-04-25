class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :expiryDate
      t.string :description
      t.string :destination
      t.string :origin
      t.integer :receiverAddress
      t.string :receiverMobNumber
      t.boolean :receiverEmail
      t.boolean :receivedByCarrier
      t.float :finalDelivery
      t.string :weight
      t.float :type
      t.float :carryingPrice
      t.float :packageValue
      t.float :rating
      t.belongs_to :senders, index: true
      t.string :carriers

      t.timestamps
    end
  end
end
