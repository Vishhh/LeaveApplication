class Salary < ActiveRecord::Base
	belongs_to :user
	belongs_to :employee
	has_many :items

	validates :month, :uniqueness => { :scope => :year,
    :message => "should happen once per year" }
  # validates :working_days, :numericality => { :less_than_or_equal_to => 31 && :greater_than_or_equal_to => 1 }, :presence => true
   validates :working_days, :inclusion => { :in => 1..31 }
  
# extend FriendlyId
#  friendly_id :salary_date, use: :slugged

#  def salary_date
#  "#{month} #{year}"
# end 

	def generate_salary_number(user)
    exiting_salary_count = Salary.count
    self.salary_number = ("%03d"%(exiting_salary_count+1))
  end

	def salary
		amount = 0
		self.items.each do |salary|
			amount = salary.amount 
		end
		amount
	end

	def final_amount
		@employees = Employee.all
		@employees.each do |employee|
			month_leave = 0
			amount = 0
				employee.leaves.where(:status => "Approve").each do |leave|			
				month_leave =  month_leave + leave.get_leave_duration_for_month(self.year ,self.month).to_f	
				end  
				amount = (employee.salary.to_f / self.working_days.to_f)*( self.working_days.to_f - month_leave.to_f )
				@item = self.items.build(employee_id: employee.id, amount: amount)
				@item.save			
		end
		if self.save
			return true
		else
			return false
		end
	end
end
