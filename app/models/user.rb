class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :employees
  has_many :leaves
  has_many :holidays
  has_many :hardwares
  has_many :salaries
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def total_leave
		total_leave = 0
			leaves.each do |leave|
				total_leave = total_leave + (leave.leave_to - leave.leave_from)
			end
			total_leave
	end
	
  def rejected_leaves
  	rejected_leaves=0 
  	leaves.each do |leave|
  		if leave.status == "Reject"
  			rejected_leaves = rejected_leaves + (leave.leave_to - leave.leave_from)
  		end
  	end
  	rejected_leaves
  end

	def approved_leaves
		approved_leaves=0
		leaves.each do |leave|
			if leave.status == "Approve"
				approved_leaves = approved_leaves + (leave.leave_to - leave.leave_from) 
			end
		end
		approved_leaves
	end
end
