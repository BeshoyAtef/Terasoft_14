class ConfirmController < ApplicationController

#This method checks the attributes of packages and set the receivedByCarrier to true to confirm taking the package.
#description - string, expiryDate - date, destination - string, origin - string, receiverAddress - string, receiverMobNumber - integer, receiverEmail - string, receivedByCarrier - boolean, finalDelivery - boolean, weight - float, type - string, carryingPrice - float, packageValue - float, rating - float.
#This method confirms the package by the carrier
#Author: Ahmed H. Nasser.
  
  def  confirm
    @comp = Packages.find( params[:id] )
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

#This method makes the user enter the carrier_id and the receivedByCarrier should be still false to show all the pending packages to be confirmed.
#carriers_id - integer, receivedByCarrier - boolean.
#This method returns all the packeges still waiting for confirmation.
#Author: Ahmed H. Nasser.
 
  def  list
    @p = params[:id]
  	@con = Packages.find( :all,  :conditions => [' carriers_id = ? AND receivedByCarrier = ? ' ,@p,false ] )
  end

  def  input
  end
  end
