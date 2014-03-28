class CreateCreatePackages < ActiveRecord::Migration
  def change
    create_table :create_packages do |t|
      t.string :destination
      t.string :description
      t.integer :weight
      t.string :origin
      t.date :Expiry_Date
      t.integer :value
      t.string :receiverAddress
      t.integer :receivermobile
      t.string :receiverMail

      t.timestamps
    end
  end
end
