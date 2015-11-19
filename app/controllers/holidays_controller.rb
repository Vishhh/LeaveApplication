class HolidaysController < ApplicationController
	def new
		@holiday = Holiday.new
	end

	def create
		@holiday = Holiday.new(holiday_params)
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
	end

	def destroy
		@holiday = Holiday.find(params[:id])
		@holiday.destroy
	end 
end
