class AddMonthToItems < ActiveRecord::Migration
  def change
    add_column :items, :salary_month, :string
  end
end
