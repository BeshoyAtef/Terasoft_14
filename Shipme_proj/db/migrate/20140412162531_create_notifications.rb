class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :description
      t.integer :user_Id

      t.timestamps
    end
  end
end
