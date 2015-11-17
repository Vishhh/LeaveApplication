class Leave < ActiveRecord::Base
	belongs_to :employee, foreign_key: "employee_id"
  belongs_to :user

  def generate_leave_number(user)
    exiting_leave_count = Leave.count
    self.leave_number = ("%03d"%(exiting_leave_count+1))
  end
end
