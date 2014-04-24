class Payment < ActiveRecord::Base
	belongs_to :users
	belongs_to :packages
end
