class Salary < ActiveRecord::Base
	belongs_to :user
	belongs_to :employee
	has_many :items


	def salary
		amount = 0
		self.items.each do |salary|
			amount = salary.amount 
		end
		amount
	end

	# def self.monthly_salary
	# 	one_day_salary = 0
	# 	employee_working_days = 0 
	# 	one_month_salary = 0
	# 	month_leave = 0

	# 	@employees.each do |employee|
	# 		employee.leaves.each do |leave|
	# 			month_leave =  month_leave + leave.get_leave_duration_for_month(@salary.year ,@salary.month)	
	# 		end
	# 		debugger
	# 		one_day_salary=	(employee.salary / @salary.working_days)			
	# 		employee_working_days = @salary.working_days - month_leave
	# 		one_month_salary = employee_working_days*one_day_salary
	# 	end
	# end
end
