class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.String :description
      t.Integer :sender_id
      t.Integerpackage_id :receiver_id

      t.timestamps
    end
  end
end
