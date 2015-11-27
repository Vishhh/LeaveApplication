class AddProfileToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :mobile_no1, :string
  	add_column :employees, :mobile_no2, :string
  	add_column :employees, :local_address, :string
  	add_column :employees, :permanent_address, :string
  end
end
