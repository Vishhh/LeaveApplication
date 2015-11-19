class Hardware < ActiveRecord::Base
	belongs_to :user

	def generate_hardware_number(user)
    exiting_hardware_count = Hardware.count
    self.hardware_number = ("%03d"%(exiting_hardware_count+1))
  end
end
