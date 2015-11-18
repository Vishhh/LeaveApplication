class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :employees
  has_many :leaves
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 #  def total_leave
	# 	total_leave = 0
	# 	if current_user || current_employee
	# 		leaves.each do |leave|
	# 			total_leave = total_leave + (leave.leave_to - leave.leave_from)
	# 		end
	# 		total_leave
	# 	end
	# end

end
