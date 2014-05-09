class Payment < ActiveRecord::Base
	belongs_to :users
	belongs_to :packages
	

	#this methods should get all payments
    #Returns: @pay
    #Author: Youssef S.Barakat
	
	def self.get_all_payments
		@pay = Payment.find( :all )
	end
end
