class BalanceController < ApplicationController

def noti
 
  dollars = 1000
  	packvalue = 500
  	if dollars < packvalue
      
  	    render(:action => 'noti')

  	else 
  		render(:action => 'accept')

  end

  def accept
  	dollars = 1000
  	packvalue = 500
  	if dollars => packvalue
 
  	    render(:action => 'accept')

  	else
  		render(:action => 'noti')
end
