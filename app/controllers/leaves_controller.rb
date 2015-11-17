class LeavesController < ApplicationController
  def index
   @leaves = Leave.where(:user_id => current_user)
  end

  def new
    @leave = Leave.new
    # @leave.generate_leave_number(current_user)
  end

  def create
    @leave = Leave.new(leave_params)
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

  private
  def leave_params
    params.require(:leave).permit(:leave_from,:status,:total, :leave_to, :task, :approved)
  end
end
