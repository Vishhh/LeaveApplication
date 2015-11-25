class LeavesController < ApplicationController
  def index
    if current_user
      @leaves = Leave.includes(:employee)
    elsif current_employee
      @leaves = Leave.where(:employee_id => current_employee)
    end
  end

  def new
    @leave = Leave.new
    if current_user
      @leave.generate_leave_number(current_user)
    else
      @leave.generate_leave_number(current_employee)
    end
  end

  def create
    @leave = Leave.new(leave_params)
    if current_user
      @leave.user_id = current_user.id
    else
       @leave.employee_id = current_employee.id
    end
    if @leave.save
      redirect_to @leave
    else
      render 'new'
    end
  end

  def show
    @leave = Leave.find(params[:id])
  end

  def edit
    @leave = Leave.find(params[:id])
  end

  def update
    @leave = Leave.find(params[:id])
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to leaves_path, notice: 'Leave was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @leave = Leave.find(params[:id])
    @leave.destroy
    redirect_to leaves_url
  end

  def approve
    @leave = Leave.find(params[:id])
    @leave.status = "Approve"
    if @leave.save
      redirect_to leaves_path
    else
      render 'new'
    end
  end

  def reject
    @leave = Leave.find(params[:id])
    @leave.status = "Reject"
    if @leave.save
     redirect_to leaves_path
    else
      render 'new'
    end
  end

  private
  def leave_params
    params.require(:leave).permit(:leave_from,:status,:total, :leave_to, :task, :approved, :halfday)
  end
end
