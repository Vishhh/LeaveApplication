class AddFieldsToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :description, :string
    add_column :holidays, :from, :date
    add_column :holidays, :to, :date
    add_column :holidays, :user_id, :integer
    add_column :holidays, :employee_id, :integer
  end
end
