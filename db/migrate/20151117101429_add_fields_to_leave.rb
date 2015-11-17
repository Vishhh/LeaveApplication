class AddFieldsToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :approved, :boolean, :default => false
    add_column :leaves, :task, :string
    add_column :leaves, :leave_from, :date
    add_column :leaves, :leave_to, :date
    add_column :leaves, :user_id, :integer
    add_column :leaves, :employee_id, :integer
    add_column :leaves, :status, :string
    add_column :leaves, :total, :string
  end
end
