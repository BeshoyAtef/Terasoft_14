class PaymentController < ApplicationController


#This method is to withdraw a certin amount of money from the creditcard in users table , notify if there is any problem in the balance , and put the withdraw amount in amountwithdraw in the database inside payment table  
#input :senderid -int , id -int , carrierid -int, carryingprice - int , packagevalue -int, packageid int
#output: returns carry.creditcards int , return sender.creditcards int 
#Author: Mario M. Wadiee

  def withdraw  
    @id = params[:id]
    @cid = params[:cid]
    @pack = Packages.find(:all,:conditions => ["senders_id = ? AND carriers_id = ?",@id,@cid]).last()
    @sender = Users.find(:all,:conditions => ["id = ?",cookies[:user_id]]).first()
    @carry = Users.find(:all,:conditions => ["id = ?",cookies[:user_id]]).first()
    @sender2 = Users.new
    @sender2.id = @sender.id
    @sender2.email = @sender.email
    @sender2.encrypted_password = @sender.encrypted_password
    @sender2.username = @sender.username
    @sender2.mobileNumber = @sender.mobileNumber
    @sender2.creditCard = @sender.creditCard
    @sender2.idNumber = @sender.idNumber
    @sender2.idVerify = @sender.idVerify
    @sender2.averageRating = @sender.averageRating
    @carry2 = Users.new
    @carry2.id = @carry.id
    @carry2.email = @carry.email
    @carry2.encrypted_password = @carry.encrypted_password
    @carry2.username = @carry.username
    @carry2.mobileNumber = @carry.mobileNumber
    @carry2.creditCard = @carry.creditCard
    @carry2.idNumber = @carry.idNumber
    @carry2.idVerify = @carry.idVerify
    @carry2.averageRating = @carry.averageRating
    if (@sender.creditCard - ( @pack.carryingPrice * Configurations.find(:all).last().comission)) < 0
      @salout = "your sender credit card balance is not enough"
      redirect_to :action => 'notify', :salout => @salout
      return
  end
    if @carry.creditCard - @pack.packageValue
       @salout = "your carrier credit card balance is not enough" 
       redirect_to :action => 'notify', :salout => @salout 
       return
  end
    @sender2.creditCard = @sender.creditCard - ( @pack.carryingPrice * Configurations.find(:all).last().comission)
    @carry2.creditCard = @carry.creditCard - @pack.packageValue
    @sender.delete
    @carry.delete
    @pay = Payment.new
    @pay.packageid = @pack.id
    @pay.amountWithdraw = ( @pack.carryingPrice * Configurations.find(:all).last().comission)+ @pack.packageValue
    @pay.users_id = @carry2.id
    @pay.save
    @sender2.save
    @carry2.save
  end


  #This method is to return the money back to the carrier creditcard when the transaction is completed and put the added amount in the amountTransfer in the payment table in the database 
  #Input:userId-int , carrierId-int , packagevalue - int , crrying price - int  
  #output: creditcard int 
  #Author: Mario M. Wadiee

  def add
    @id = params[:id]
    @cid = params[:cid]
    @pack = Packages.find(:all,:conditions => ["senders_id = ? AND carriers_id = ?",@id,@cid]).last()
    @carry = Users.find(:all,:conditions => ["id = ?",params[:cid]]).first()
    @carry2 = Users.new
    @carry2.id = @carry.id
    @carry2.email = @carry.email
    @carry2.encrypted_password = @carry.encrypted_password
    @carry2.username = @carry.username
    @carry2.mobileNumber = @carry.mobileNumber
    @carry2.creditCard = @carry.creditCard
    @carry2.idNumber = @carry.idNumber
    @carry2.idVerify = @carry.idVerify
    @carry2.averageRating = @carry.averageRating
    @carry2.creditCard = @carry.creditCard + @pack.packageValue
    @pay = Payment.new
    @pay.packageid = @pack.id
    @pay.amountTransfer = @pack.packageValue
    @pay.users_id = @carry2.id
    @pay.save
    @carry.delete
    @carry2.save

  end
  end