class Payment < ActiveRecord::Base
	belongs_to :users
	belongs_to :packages


#This method is to call the controller method update to redirect add the withdraw money in amountWithdraw. 
#inputs: no inputs
#output :amountWithdraw int.
#Author : Mario M. wadiee.

	def self.update(payment,value,user_id,withdraw)
		Payment.find( :all, :conditions => :amountWithdraw => withdraw)
		payment.amountWithdraw => value)
		payment.users_id => user_id)        
	end	
end
