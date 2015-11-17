class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   def after_sign_in_path_for(resource)
		if (resource == current_user)
		  users_path
	  elsif (resource == current_employee)
	    employees_path
		end
	end
end
