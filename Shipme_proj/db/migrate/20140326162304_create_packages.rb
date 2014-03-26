class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :destination
      t.string :description
      t.integer :weight
      t.string :origin
      t.date :ExpiryDate
      t.integer :value
      t.string :receiverAddress
      t.integer :receiverMobile
      t.string :receiverMail
      t.string :ReceiverAccount

      t.timestamps
    end
  end
end
