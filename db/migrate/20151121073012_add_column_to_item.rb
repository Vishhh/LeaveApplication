class AddColumnToItem < ActiveRecord::Migration
  def change
    add_column :items, :salary_id, :integer
  end
end
