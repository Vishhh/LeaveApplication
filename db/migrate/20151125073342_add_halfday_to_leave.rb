class AddHalfdayToLeave < ActiveRecord::Migration
  def change
    add_column :leaves, :halfday, :boolean, :default => false
  end
end