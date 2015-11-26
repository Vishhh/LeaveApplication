class RemoveFromItem < ActiveRecord::Migration
  def change
  	remove_column :items, :employee_name, :string
  	remove_column :items, :salary_month, :string
  end
end
