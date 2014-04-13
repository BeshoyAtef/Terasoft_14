class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :username
      t.integer :mobileNumber
      t.integer :creditCard
      t.boolean :admin
      t.integer :idNumber
      t.integer :idVerify
      t.float :averageRating
      t.date :dateOfRegister
      t.integer :user_Id

      t.timestamps
    end
  end
end
