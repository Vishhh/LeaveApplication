class ChangeIntegerFormatInSalary < ActiveRecord::Migration
  def up
   change_column :salaries, :month, :integer
   change_column :salaries, :year, :integer
  end

  def down
   change_column :salaries, :month, :string
   change_column :salaries, :year, :string
  end
end
