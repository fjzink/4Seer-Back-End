class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
    	t.string 	:lpid
    	t.string 	:ocid
    	t.string 	:product_code
    	t.string	:primary_id
      t.float :current_balance

      t.timestamps
    end
  end
end
