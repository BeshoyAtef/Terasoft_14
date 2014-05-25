class Payment < ActiveRecord::Base
  belongs_to :users
  belongs_to :packages

  #This methods should get all payments
  #Returns: @pay
  #Author: Youssef S.Barakat
  
  def  self.get_all_payments
    @pay = Payment.find( :all )
  end


  #This methods should get all payments to verify the credit
  #Inputs:cookies[:user_id]-int
  #Returns: @amount
  #Author: Youssef S.Barakat

  def  self.get_payments_credit( user_id )
    @amount = Payment.find( :all, :conditions => {:users_id => user_id} )
  end
  
  
  #This method is to call the controller method update to redirect add the withdraw money in   amountWithdraw. 
  #inputs: no inputs
  #output :amountWithdraw int.
  #Author : Mario M. wadiee.

  def  self.update(payment,value,user_id,withdraw)
    Payment.find( :all, :conditions => :amountWithdraw => withdraw)
    payment.amountWithdraw => value)
    payment.users_id => user_id)        
  end
end
