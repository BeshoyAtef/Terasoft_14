class RevenuesController < ApplicationController
#This method find the admin attribute in the table users and check if its true and then gets the creditcard number and checks if this creditcard is the same as the amount payment inside the table payment 
#Admin - boolean, creditCard number - integer, amountTransfer - float
#This method returns the revenue of the creditCard 
#Author: Abdelrahman Y. Seoudy

  def  rev
  	   @admin = Users.find(:all,:conditions => ['admin = true']).last()
  	   @cred = @admin.id
	     @total = 0
  	   @pay = Payment.find(:all)
	     @pay.each do |s|
  		 if(s.users_id == @cred)
  			@total = @total + s.amountTransfer
  		end
  end
end
