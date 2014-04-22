class ConfirmController < ApplicationController
  def confirm
  @comp = Packages.find(params[:id])
  @new = Packages.new
   @new.id = @comp.id
   @new.description = @comp.description
   @new.expiryDate = @comp.expiryDate
   @new.destination = @comp.destination
   @new.origin = @comp.origin
   @new.receiverAddress = @comp.receiverAddress
   @new.receiverMobNumber = @comp.receiverMobNumber
   @new.receiverEmail = @comp.receiverEmail
   @new.finalDelivery = @comp.finalDelivery
   @new.weight = @comp.weight
   @new.carryingPrice = @comp.carryingPrice
   @new.packageValue = @comp.packageValue
   @new.rating = @comp.rating
   @new.receivedByCarrier = true
   @comp.destroy
   @new.save
   
  end

  def list
  	
  	@p = params[:id]
  	@con = Packages.find(:all,  :conditions => [' carriers_id = ? AND receivedByCarrier = ? ' ,@p,false ])

  end

  def input
  end

end
