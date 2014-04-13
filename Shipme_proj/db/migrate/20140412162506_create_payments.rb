class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :packageid
      t.float :amountWithdraw
      t.float :amountTransfer
      t.date :date
      t.integer :user_Id
      t.integer :package_Id


      t.timestamps
    end
  end
end
