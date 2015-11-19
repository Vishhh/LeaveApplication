class AddFieldToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :holiday_number, :integer
  end
end
