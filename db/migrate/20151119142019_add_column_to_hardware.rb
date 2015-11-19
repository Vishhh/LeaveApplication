class AddColumnToHardware < ActiveRecord::Migration
  def change
    add_column :hardwares, :hardware_number, :integer
  end
end
