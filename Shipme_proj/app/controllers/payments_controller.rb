class PaymentsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end


 #This method calculates the amount transfer.
 #amountTransfer - float.
 #This method returns the revenue of the database. 
 #Author: Abdelrahman Y. Seoudy

  def  list
     @admin = Users.find_admin
     @id = @admin.id
     @total = 0
     @pay = Payment.find_payments(@id)
     @pay.each do |s|
     if(s.users_id == @id)
        @total = @total + s.amountTransfer
     end 
   end
  end

  def show
  end

  def delete
  end

  def destory
  end
end
