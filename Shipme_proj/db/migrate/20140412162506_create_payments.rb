class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :packageid
      t.float :amountWithdraw
      t.float :amountTransfer
      t.belongs_to :users
      t.belongs_to :packages


      t.timestamps
    end
  end
  
  def self.down
    drop_table :payments
  end
end
