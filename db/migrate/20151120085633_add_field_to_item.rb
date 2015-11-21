class AddFieldToItem < ActiveRecord::Migration
  def change
    add_column :items, :employee_id, :integer
    add_column :items, :user_id, :integer
    add_column :items, :amount, :float
  end
end
