class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      ## Database authenticatable
      t.string :email
      t.string :encrypted_password
      t.string :username
      t.integer :mobileNumber
      t.integer :creditCard
      t.boolean :admin
      t.integer :idNumber
      t.boolean :idVerify
      t.float :averageRating

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    
      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
