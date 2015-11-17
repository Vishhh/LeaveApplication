class Leave < ActiveRecord::Base
	belongs_to :employee, foreign_key: "employee_id"
  belongs_to :user
end
