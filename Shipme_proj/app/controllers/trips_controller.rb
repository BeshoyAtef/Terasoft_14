class TripsController < ApplicationController
 def  index
  lis = Trips.find(:all)
  end
  
def complete_user
   @comp = Users.find(params[:id])
   @com = @comp.id
   @comp.destroy
   @complete = Users.new
   @complete.creditCard = params[:requiredcrdtcardnum]
   @complete.mobileNumber = params[:requiredmobnum]
   @complete.idNumber = params[:requiredidnum]
   @complete.save
   redirect_to :action => 'newtrips'

end


  def  create
	 
  @userId = 2
	 @ver = Users.find(@userId)
	 
	     
	 if (@ver[:creditCard]== nil)
	    redirect_to :action =>'complete' , :id => @userId
 
	 elsif (@ver[:mobileNumber]== nil)
    redirect_to :action =>'complete' , :id => @userId

	 elsif (@ver[:idNumber] == nil )
    redirect_to :action =>'complete' , :id => @userId
  
   
   elsif  @ver[:idVerify] == 1
		  @trip = Trips.new
		  @trip.destination = params[:requireddestination]
		  @trip.location = params[:requiredlocation]
		  @trip.maxWeight = params[:requiredweight]
		  @trip.travelDate = params[:requiredtraveldate]
		  @trip.save
		 redirect_to :action =>'newtrips'  
   else
   redirect_to :action =>'newtrips' 
   end

  end
  end          
