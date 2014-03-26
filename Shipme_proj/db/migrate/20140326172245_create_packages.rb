class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.Date :expiry_date
      t.String :description
      t.String :destination
      t.String :weight
      t.String :origin
      t.String :receiver_adress
      t.Integer :receiver_mobilenumber
      t.String :receiver_email
      t.Boolean :accepted
      t.Boolean :delivered

      t.timestamps
    end
  end
end
