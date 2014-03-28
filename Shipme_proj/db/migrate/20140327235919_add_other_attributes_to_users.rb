class AddOtherAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullName, :string
    add_column :users, :mobileNumber, :integer
  end
end
