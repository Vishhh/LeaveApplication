class AddColumnToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :month, :string
    add_column :salaries, :year, :string
    add_column :salaries, :employee_id, :string
    add_column :salaries, :user_id, :string
    add_column :salaries, :working_days, :string
  end
end
