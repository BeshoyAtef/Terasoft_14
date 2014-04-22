class TripsController < ApplicationController

 #This method adds the attributes of the failure scenario to the database.
 #creditCard - integer, mobileNumber - integer, idNumber - integer.
 #This method return the attributes entered in the database.
 #Author: Ahmed H. Nasser.

  def  complete_user
    @comp = Users.find(params[:id])
    @com = @comp.id
    @comp.destroy
    @complete = Users.new
    @complete.creditCard = params[:requiredcrdtcardnum]
    @complete.mobileNumber = params[:requiredmobnum]
    @complete.idNumber = params[:requiredidnum]
    if @complete.save

      redirect_to :action => 'newtrips'
    else 
      redirect_to :action => 'complete'
  end
  end

 #This method creates add trip and also check if the user didnt add his/her creditcard/mobile number/id number.
 #Destination - string, location - string, maxWeight - float, travelDate - date.
 #This method returns the values inserted to the database.
 #Author: Ahmed H. Nasser.

  def  create
    @userId = Users.find(:all).last().id
	  @ver = Users.find(@userId)
    if (@ver[:creditCard]== nil)
      redirect_to :action => 'complete' , :id => @userId
    elsif (@ver[:mobileNumber]== nil)
      redirect_to :action => 'complete' , :id => @userId
    elsif (@ver[:idNumber] == nil)
      redirect_to :action => 'complete' , :id => @userId
    elsif  @ver[:idVerify] == true || @ver[:idVerify] != true
		  @trip = Trips.new
		  @trip.destination = params[:requireddestination]
		  @trip.location = params[:requiredlocation]
		  @trip.maxWeight = params[:requiredweight]
		  @trip.travelDate = params[:requiredtraveldate]
		if @trip.save
		  redirect_to :action => 'index'  
    else
      redirect_to :action => 'index'
  end
    else
      redirect_to :action => 'newtrips' 
  end
  end
  end          
