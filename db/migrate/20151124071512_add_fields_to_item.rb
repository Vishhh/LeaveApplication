class AddFieldsToItem < ActiveRecord::Migration
  def change
    add_column :items, :employee_name, :string
  end
end
