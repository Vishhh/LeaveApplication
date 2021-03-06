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
		@salary = @salary.final_amount
		
		if @salary == true
			redirect_to salaries_path
		else
			flash[:alert] = "Something went wrong!"
			redirect_to new_salary_path
		end
	end

	def edit
		@salary = Salary.find(params[:id])
	end

	def update
		@salary = Salary.find(params[:id])
		@salary.update(salary_params)
	end

	def destroy
		@salary = Salary.find(params[:id])
		@salary.destroy
	end

	def show
		@salary = Salary.find(params[:id])
		@items = Item.all
	end

	private
	def salary_params
		params.require(:salary).permit(:month, :year, :total, :working_days)
	end
end
