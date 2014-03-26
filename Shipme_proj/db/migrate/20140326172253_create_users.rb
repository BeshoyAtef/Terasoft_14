class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.String :email
      t.String :password
      t.String :fullname
      t.Integer :mobilenumber
      t.Integer :creditcard

      t.timestamps
    end
  end
end
