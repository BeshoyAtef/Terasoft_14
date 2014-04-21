class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :description
      t.belongs_to :senders
      t.belongs_to :receivers

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
