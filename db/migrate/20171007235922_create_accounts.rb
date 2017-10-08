class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
    	t.integer	:id
    	t.string 	:lpid
    	t.string 	:ocid
    	t.string 	:product_code
    	t.integer	:primary_id

      t.timestamps
    end
  end
end
