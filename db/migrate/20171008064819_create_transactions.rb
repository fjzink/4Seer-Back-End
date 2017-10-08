class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.datetime :date_time
      t.float :posted_amount
      t.string :description
      t.string :short_descript

      t.timestamps
    end
  end
end
