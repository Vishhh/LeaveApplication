class Leave < ActiveRecord::Base
	belongs_to :employee, foreign_key: "employee_id"
  belongs_to :user
	validates :leave_from, :leave_to, presence: true
  def generate_leave_number(user)
    exiting_leave_count = Leave.count
    self.leave_number = ("%03d"%(exiting_leave_count+1))
  end

	# def total_leave
	# 	total_leave = 0
	# 	if current_user || current_employee
	# 		self.each do |leave|
	# 			total_leave = total_leave + (leave.leave_to - leave.leave_from)
	# 		end
	# 		total_leave
	# 	end
	# end
end
