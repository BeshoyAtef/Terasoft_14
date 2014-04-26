class TripsController < ApplicationController

#This method adds the attributes of the failure scenario to the database.
#creditCard - integer, mobileNumber - integer, idNumber - integer.
#This method return the attributes entered into the database.
#Author: Ahmed H. Nasser.

  def  complete_user

    @complete = Users.new
    @comp = Users.find(cookies[ :user_id ])
    @complete.id = @comp.id
    @complete.creditCard = params[:requiredcrdtcardnum]
    @complete.mobileNumber = params[:requiredmobnum]
    @complete.idNumber = params[:requiredidnum]
    @complete.encrypted_password = @comp.encrypted_password
    @complete.username = @comp.username
    @complete.admin = @comp.admin
    @complete.idVerify = @comp.idVerify
    @complete.averageRating = @comp.averageRating
    @complete.reset_password_token = @comp.reset_password_token
    @complete.reset_password_sent_at = @comp.reset_password_sent_at
    @complete.remember_created_at = @comp.remember_created_at
    @complete.sign_in_count = @comp.sign_in_count
    @complete.current_sign_in_at = @comp.current_sign_in_at
    @complete.last_sign_in_at = @comp.last_sign_in_at
    @complete.current_sign_in_ip = @comp.current_sign_in_ip
    @complete.last_sign_in_ip = @comp.last_sign_in_ip
    @complete.created_at = @comp.created_at
    @comp.destroy
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
    @userId = Users.find(cookies[ :user_id ])
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
