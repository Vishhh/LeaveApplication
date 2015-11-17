class AddColumnToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :leave_number, :integer
  end
end
