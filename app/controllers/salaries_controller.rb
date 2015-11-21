class SalariesController < ApplicationController
	def new
		@salary = Salary.new
		# @salary.items.build
	end

	def index
		@salaries = Salary.all
	end

	def create
		@salary = Salary.new(salary_params)
		@employees = Employee.all
		# @salary.user_id = current_user.id
		one_day_salary = 0
		employee_working_days = 0 
		one_month_salary = 0
		month_leave = 0
			@employees.each do |employee|
				employee.leaves.each do |leave|
					month_leave =  month_leave + leave.get_leave_duration_for_month(@salary.year ,@salary.month)	
				end
				debugger
				one_day_salary =	(employee.salary / @salary.working_days)			
				employee_working_days =  (month_leave.to_f + @salary.working_days) 
				one_month_salary = employee_working_days*one_day_salary
			end
	end

	def edit
		@salary = Salary.find(params[:id])
	end

	def update
		@salary = Salary.find(params[:id])
		@salary.update
	end

	def destroy
		@salary = Salary.find(params[:id])
		@salary.destroy
	end

	def show
		@salary = Salary.find(params[:id])
	end

	private
	def salary_params
		params.require(:salary).permit(:month, :year, :total, :working_days)
	end
end
