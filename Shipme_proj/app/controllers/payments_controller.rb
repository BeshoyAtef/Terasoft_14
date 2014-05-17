class PaymentsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end


   #This method to check the creditcard amount to withdraw pack value from it and to update table payments.
  #Inputs: creditcard int , carryingprice int , id int , packvalue int. 
  #Outputs: id int , value_payments int , amountWithdraw int.
  #Author : Mario M. Wadiee.

  def  update
     sid = params[:sid]
     cid = params[:cid]
    @pack.to_a.each do|p|
    @p = Packages.get_packages_payments(sid,cid)
    @sender = Users.get_sender_payments(sid)
    @carry = Users.get_carrier_payments(cid)
    @sender.to_a.each do|s| 
     
    if (s.creditCard - ( @p.carryingPrice * Configurations.find(:all).last().comission)) < 0
      @salout = "your sender credit card balance is not enough"
      redirect_to :action => 'notify', :salout => @salout
      return
    else
      @saleout2 = "your credit card is accepted"
      redirect_to :action => 'withdraw', :salout => @salout2
  end
    @carry.to_a.each do|c|
    
    if c.creditCard - p.packageValue<0
       @salout = "your carrier credit card balance is not enough" 
       redirect_to :action => 'notify', :salout => @salout 
       return
       else
      @saleout2 = "your credit card is accepted"
      redirect_to :action => 'withdraw', :salout => @salout2
    end
    @value = s.creditCard - ( p.carryingPrice * Configurations.find(:all).last().comission)
    Users.update_creditcard(@sender,@value)
    @value2 = c.creditCard - p.packageValue
    Users.update_creditcard(@carry,@value2)
    @sender.delete
    @carry.delete
  end
    @pay = Payment.get_packages_payments(sid)
    @pay.packageid = @pack.id
    @value_payment = ( p.carryingPrice * Configurations.find(:all).last().comission)+ p.packageValue
    Payment.update(p,2000,id)
    Payment.amountWithdraw = @value_payment
    @pay.save
    @sender.save
    @carry.save
  end
  end
  
  end

  def list
  end

  def show
  end

  def delete
  end

  def destory
  end
end
