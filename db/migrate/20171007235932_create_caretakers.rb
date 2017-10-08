class CreateCaretakers < ActiveRecord::Migration[5.1]
  def change
    create_table :caretakers do |t|
    	t.string 	:name
    	t.string	:phone
    	t.string	:email
    	t.string	:address
    	t.boolean	:primary_caretaker

    	t.references :account

      t.timestamps
    end
  end
end
