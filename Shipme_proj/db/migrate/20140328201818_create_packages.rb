class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|

      t.timestamps
    end
  end
end
