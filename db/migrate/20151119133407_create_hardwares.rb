class CreateHardwares < ActiveRecord::Migration
  def change
    create_table :hardwares do |t|

    	t.string :model_no
    	t.string :name
    	t.date   :purchase_date
    	t.string :brand
    	t.string :description
    	t.integer :token_no
      t.timestamps null: false
    end
  end
end
