class AddSnoToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :salary_number, :integer
  end
end
