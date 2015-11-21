class Leave < ActiveRecord::Base
	belongs_to :employee
  belongs_to :user
	validates :leave_from, :leave_to, presence: true
  def generate_leave_number(user)
    exiting_leave_count = Leave.count
    self.leave_number = ("%03d"%(exiting_leave_count+1))
  end

	def at_beginning_of_month
		at_beginning_of_month = '#{year}-#{month}-01'
		at_beginning_of_month.to_date
	end

	def at_end_of_month
		at_beginning_of_month.to_date.end_of_month
	end

	def get_leave_duration_for_month(month, year)
		if self.leave_from >= at_beginning_of_month and self.leave_to <= at_end_of_month
				(leave_from - leave_to).to_i
		elsif self.leave_from >= at_beginning_of_month and self.leave_to >= at_end_of_month
				((at_end_of_month +1) - leave_to).to_i 
		elsif self.leave_from <= at_beginning_of_month and self.leave_to >= at_beginning_of_month
				(leave_to -(at_beginning_of_month -1)).to_i
		end
	end
end
	# def total_leave
	# 	total_leave = 0
	# 	if current_user 
	# 		self.each do |leave|
	# 			total_leave = total_leave + (leave.leave_to - leave.leave_from)
	# 		end
	# 		total_leave
	# 	end
	# end
# 	if leave_from < leave_to
# 		employee.leaves.where('leave_from >= beginning_of_month  and leave_to <= end_of_month').count
#   elsif leave_from > leave_to
#     employee.leaves.where('leave_from >= at_beginning_of_month..at_end_of_month ').count
#     employee.leaves.where('leave_to <= at_beginning_of_month..at_end_of_month ').count
#   end
# 	# def beginning_of_month
# 	#   Thread.current[:leave_from]
# 	# end 
# 	def beginning_of_day
# 	  in_time_zone
# 	end

# 	def end_of_day
# 	  in_time_zone.end_of_day
# 	end

# 	def get_employee_month_leave(employee, month, year)
# 		# employee.leaves.where(' > ?', 1)
# 	employee.leaves.where('extract(month from leave_from) = ?', month)
# 	employee.leaves.where('leave_from >= at_beginning_of_month and leave_to <= at_end_of_month').count
	

# 		# employee.leaves.where('leave_from > ? at_beginning_of_month').count
#   end
# # Leave.where(:leave_from => 1.months.ago..Time.now).count
# Leave.where('extract(month from leave_from) = ?', )
# employee.leaves.where('leave_from > ? AND leave_to < ?', DateTime.parse(date).beginning_of_month, DateTime.parse(date).end_of_month}
# Leave.where("MONTH(leave) = ? ", DateTime.now.month)
# Leave.find(:all, :conditions => {:created_at => leave_from.beginning_of_day..@selected_date.end_of_day})
# Leave.where( 'Time.now.beginning_of_month > ? and Time.now.end_of_month < ? ').count
# employee.leaves.where( Time.now.beginning_of_month..Time.now.end_of_month).count
# employee.leaves.where('leave_from > ? at_beginning_of_month and leave_to < ? at_end_of_month').count
# end