class Item < ActiveRecord::Base
	belongs_to :salary

	extend FriendlyId
  friendly_id :amount, use: :slugged
end
