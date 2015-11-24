class SalariesController < ApplicationController
	def new
		@salary = Salary.new
		@salary.generate_salary_number(current_user)
	end

	def index
		@salaries = Salary.all
	end

	def create
		@salary = Salary.new(salary_params)
		@employees = Employee.all
		@salary.save
		month_leave = 0
		amount = 0
		@employees.each do |employee|
			employee.leaves.each do |leave|
				if leave.status == "Approve"
				month_leave =  month_leave + leave.get_leave_duration_for_month(@salary.year ,@salary.month)	
				end
			end
		amount = (employee.salary / @salary.working_days)*(month_leave.to_f + @salary.working_days)
		@item = Item.new(employee_name: employee.name, employee_id: employee.id, amount: amount, salary_month: @salary.month, salary_id: @salary.id)
		@item.save
end
		if @salary.save
			redirect_to salaries_path
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
