class AddFieldsToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :desctiption, :string
    add_column :holidays, :leave_from, :string
    add_column :holidays, :leave_to, :string
  end
end
