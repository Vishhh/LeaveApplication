class EmployeesController < ApplicationController
	load_and_authorize_resource

	def index
		@employees= Employee.all
	end

	def create
		@employee= Employee.new(employee_params)
	end

	def new
		@employee= Employee.new

	end
	def show
		@employee = Employee.find(params[:id])
	end
	def edit
		@employee = Employee.find(params[:id])
	end
  def update
  	@employee = Employee.find(params[:id])
	  if @employee.update(employee_params)
	    redirect_to employees_path
	  else
	    render 'edit'
	  end 
  end

  private
  def employee_params
		params.require(:employee).permit(:email, :password, :name, :salary, :avatar, :mobile_no1, :mobile_no2, :local_address, :permanent_address)
  end 
end
