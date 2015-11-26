class AddSlugToSalary < ActiveRecord::Migration
  def change
    add_column :salaries, :slug, :string
  end
end
