class AddFieldsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :salary, :string
  end
end
