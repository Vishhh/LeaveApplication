class Item < ActiveRecord::Base
	belongs_to :salary
	belongs_to :employee

	# extend FriendlyId
 #  friendly_id :amount, use: :slugged
end
