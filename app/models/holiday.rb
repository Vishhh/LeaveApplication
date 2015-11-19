class Holiday < ActiveRecord::Base
	belongs_to :employee, foreign_key: "employee_id"
  belongs_to :user

  def generate_holiday_number(user)
    exiting_holiday_count = Holiday.count
    self.holiday_number = ("%03d"%(exiting_holiday_count+1))
  end
end
