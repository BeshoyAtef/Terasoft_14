class RemoveDetailsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :idNumber
  	remove_column :users, :mobileNumber
  end
end
