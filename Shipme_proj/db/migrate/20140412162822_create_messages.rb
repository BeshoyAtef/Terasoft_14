class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :description
      t.date :dateTime
      t.integer :sender_Id
      t.integer :receiver_Id

      t.timestamps
    end
  end
end
