class AddSlugToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :slug, :string
  end
end
