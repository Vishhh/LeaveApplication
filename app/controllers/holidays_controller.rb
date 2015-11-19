class HolidaysController < ApplicationController
	def new
		@holiday = Holiday.new
		if current_user
      @holiday.generate_holiday_number(current_user)
    end
	end

	def create
		@holiday = Holiday.new(holiday_params)

		if current_user
      @holiday.user_id = current_user.id 			
    end
    if @holiday.save
      redirect_to holidays_path
    else
      render 'new'
    end
	end

	def index
		@holidays = Holiday.all
	end

	def show
		@holiday = Holiday.find(params[:id])
	end

	def edit
		@holiday = Holiday.find(params[:id])
	end

	def update
		@holiday = Holiday.find(params[:id])
		if @holiday.update(holiday_params)
      redirect_to holidays_path
    else
      render 'new'
    end
	end

	def destroy
		@holiday = Holiday.find(params[:id])
		@holiday.destroy
	end 

	private
	def holiday_params
		params.require(:holiday).permit(:from, :to, :description, :holiday_number)
	end
end
