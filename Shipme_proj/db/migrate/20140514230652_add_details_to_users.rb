class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :idNumber, :bigint
  	add_column :users, :mobileNumber, :bigint
  	add_column :users, :creditCardNumber, :bigint
  end
end
