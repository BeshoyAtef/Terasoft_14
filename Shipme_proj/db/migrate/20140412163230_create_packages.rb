class CreatePackages < ActiveRecord::Migration
  def change
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
      t.date :creationDate
      t.float :weight
      t.string :type
      t.float :carryingPrice
      t.float :packageValue
      t.float :rating
      t.integer :sender_Id
      t.integer :carrier_Id
      t.integer :package_Id

      t.timestamps
    end
  end
end
