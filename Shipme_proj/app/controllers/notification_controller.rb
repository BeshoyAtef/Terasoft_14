class NotificationController < ApplicationController
  def index
  end

  def verify_idNumber (current_user)

  	@verification=Users.find(:all, :conditions {:user_id = current_user})
  	if(@verification != nil and users.idNumber != nil)
  		@notifications= Notifications.new
  		@notifications.user_id = current_user
  		@notification.description = "Your id is verified"
  		@notification.save
  	end
  end
  		


  def notify_requests (user_id)

    @requests=Requests.find(:all, :conditions {:carrier_id = user_id})
	if(@requests != nil)
		@carriers_id=Array.new
		@requests.each do |t|
		@carrier_id=t.carrier_Id
		@carriers_id.push @carrier_id
	end
		@notifications=Array.new
		@carriers_id.each do |t|
		@notification=notification.new
	    @notification.user_Id=t
		@notification.description="You have a request of a package"
		@notifications.push @notification
	end
	@notifications.save
    end

    def notify_acceptance (current_user)
    	@acceptance=Requests.find(:all, :conditions {:sender_id = current_user and :accept = true})
    	if(@acceptance !=nil)
    	   @notifications= Notifications.new
  		   @notifications.user_id = current_user
  		   @notification.description = "Your package is accepted"
  		   @notification.save
  		end

    def notify_reject (current_user)
    	@acceptance=Requests.find(:all, :conditions {:sender_id = current_user and :accept = false})
    	if(@acceptance !=nil)
    	   @notifications= Notifications.new
  		   @notifications.user_id = current_user
  		   @notification.description = "Your package is rejected"
  		   @notification.save
  		end

  	def notify_cancellation (current_user)
    	@acceptance=Requests.find(:all, :conditions {:sender_id = current_user and :package_id = nil})
    	if(@acceptance !=nil)
    	   @notifications= Notifications.new
  		   @notifications.user_id = current_user
  		   @notification.description = "Your package is cancelled"
  		   @notification.save
  		end




end
