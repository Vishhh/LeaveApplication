class AddSalaryToItem < ActiveRecord::Migration
  def change
    add_column :items, :employee_salary, :string
  end
end
