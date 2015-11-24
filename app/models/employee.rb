class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :leaves 
	has_many :holidays
	has_many :salaries
	belongs_to :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :salary, presence: true       

	# def get_employee_month_leave(year, month)
	# 	month_leave = 0
	# 	# self.leaves.where("strftime('%Y', leaves.leave_from) = ? AND strftime('%m', leaves.leave_from) + 0 = ?", year, month)
	# 		self.leaves.each do |leave|
	# 			month_leave =  month_leave + leave.get_leave_duration_for_month()
	# 		end
	# 	month_leave
	# end

	def total_leave
		total_leave = 0
		self.leaves.each do |leave|
			total_leave = total_leave + (leave.leave_to - leave.leave_from)
		end
		total_leave
	end

	 def rejected_leaves
	 	rejected_leaves=0 
	 	self.leaves.each do |leave|
	 		if leave.status == "Reject"
	 			rejected_leaves = rejected_leaves + (leave.leave_to - leave.leave_from)
	 		end
	 	end
	 	rejected_leaves
	 end

	def approved_leaves
		approved_leaves=0
		self.leaves.each do |leave|
			if leave.status == "Approve"
				approved_leaves = approved_leaves + (leave.leave_to - leave.leave_from) 
			end
		end
		approved_leaves
	end
   
end
