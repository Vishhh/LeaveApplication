class UsersController < ApplicationController
	load_and_authorize_resource
	def index
	@users= User.all
	end

	def new
		@user= User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

  def update
  	@user = User.find(params[:id])
	  if @user.update
	    redirect_to @user
	  else
	    render 'edit'
	  end 
  end
end
