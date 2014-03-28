class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.int :dollars
      t.int :packvalue

      t.timestamps
    end
  end
end
