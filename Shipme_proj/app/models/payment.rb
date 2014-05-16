class Payment < ActiveRecord::Base
	belongs_to :users
	belongs_to :packages

	#This methods should get all payments
  #Returns: @pay
  #Author: Youssef S.Barakat
	
	def  self.get_all_payments
		@pay = Payment.find( :all )
	end
end
