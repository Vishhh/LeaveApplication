class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery with: :exception
  protect_from_forgery with: :exception
   def after_sign_in_path_for(resource)
		if (resource == current_user)
		  users_path
	  elsif (resource == current_employee)
	    employees_path
		end
	end


	def current_ability
	  if employee_signed_in?
	    @current_ability ||= Ability.new(current_employee)
	  else
	    @current_ability ||= Ability.new(current_user)
	  end
	end
end
