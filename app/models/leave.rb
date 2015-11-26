class Leave < ActiveRecord::Base
	belongs_to :employee
  belongs_to :user
	validates :leave_from, :leave_to, presence: true
	
  def generate_leave_number(user)
    exiting_leave_count = Leave.count
    self.leave_number = ("%03d"%(exiting_leave_count+1))
  end

	def at_beginning_of_month
		at_beginning_of_month = '#{year}-#{month}-01'
		at_beginning_of_month.to_date
	end

	def at_end_of_month
		at_beginning_of_month.to_date.end_of_month
	end

	def get_leave_duration_for_month(month, year)
		 # debugger
		if self.halfday == true
			  # debugger
		  if self.leave_from >= at_beginning_of_month and self.leave_to <= at_end_of_month
		      -((leave_from - leave_to ).to_f - 0.5)
		  elsif self.leave_from >= at_beginning_of_month and self.leave_to > at_end_of_month
		  	# debugger
		      ((at_end_of_month + 1.day) - leave_from ).to_f + 0.5
		  elsif self.leave_from < at_beginning_of_month and self.leave_to >= at_beginning_of_month
		      (leave_to -(at_beginning_of_month - 1.day )).to_f - 0.5
		  end 
		else
			 # debugger
		  if self.leave_from >= at_beginning_of_month and self.leave_to <= at_end_of_month
		      -(leave_from - leave_to).to_i
		  elsif self.leave_from >= at_beginning_of_month and self.leave_to > at_end_of_month
		      ((at_end_of_month + 1.day) - leave_from).to_i 
		  elsif self.leave_from < at_beginning_of_month and self.leave_to >= at_beginning_of_month
		      (leave_to -(at_beginning_of_month - 1.day)).to_i
		  end 
		end
	end
end