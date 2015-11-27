class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :leaves 
	has_many :holidays
	has_many :salaries
	has_many :items
	belongs_to :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :salary, presence: true  
  validates :email, presence: true  

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/    

	# extend FriendlyId
 #  friendly_id :name, use: :slugged
	
	def total_leave
		total_leave = 0
		self.leaves.each do |leave|
			total_leave = total_leave + (leave.leave_to - leave.leave_from)
		end
		total_leave.to_i
	end

	def rejected_leaves
	 	rejected_leaves=0 
	 	self.leaves.each do |leave|
	 		if leave.status == "Reject"
	 			rejected_leaves = rejected_leaves + (leave.leave_to - leave.leave_from)
	 		end
	 	end
	 	rejected_leaves.to_i
	end

	def approved_leaves
		approved_leaves=0
		self.leaves.each do |leave|
			if leave.status == "Approve"
				approved_leaves = approved_leaves + (leave.leave_to - leave.leave_from) 
			end
		end
		approved_leaves.to_i
	end
   
end
