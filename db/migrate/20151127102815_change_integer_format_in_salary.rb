class ChangeIntegerFormatInSalary < ActiveRecord::Migration
  def change
   	change_column :salaries, :month, 'integer USING CAST(month AS integer)'
   	change_column :salaries, :year, 'integer USING CAST(year AS integer)'
  end
end
