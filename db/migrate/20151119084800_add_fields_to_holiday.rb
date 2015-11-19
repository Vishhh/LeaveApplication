class AddFieldsToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :desctiption, :string
    add_column :holidays, :leave_from, :date
    add_column :holidays, :leave_to, :date
    add_column :holidays, :user_id, :integer
    add_column :holidays, :employee_id, :integer
  end
end
