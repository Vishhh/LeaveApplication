class AddColumnToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :month, :string
    add_column :salaries, :year, :string
    add_column :salaries, :employee_id, :integer
    add_column :salaries, :user_id, :integer
    add_column :salaries, :working_days, :float
  end
end
