class HandlingRequestsController < ApplicationController

	#This method get array of users that sent request to a certain user
	#input: requests
	#output: users that sent request
	def  index
		#@user_id = current_user.id
  		@requests = Requests.find(:all, :conditions => {:carrier_Id => params[ :id ]})
  		@users = Array.new
  		@requests.each do|t| 
				@user = Users.find(:all, :conditions => {:id => t.sender_Id})
				@users.push @user
		end
	end

  #This method show request in the view to accept or reject it
  #input: request
  #output: show request

	def  show
		@request = Requests.find(params[ :id ])
	end

	#This method delete all other requests sent to other carriers from the sender
	#Input: request record
	#output:delete other requests from the sender to other carrier,notify
	#Author: Mohamed M.Khairy

	def  accept 
		request = Requests.find( params[ :id ] )
		requests = Requests.find(:all, :conditions => {:carrier_Id =>  params[:id ]} )
		if (request.accept == nil)
			request.update(:accept => true)
			notification (request.carrier_Id)
			accept_helper(requests)
			request.destroy
			redirect_to(:action => 'index')
		end
	end

	#This method is a helper method for accept to delete other requests from the sender to oter carriers
	#Input: requests sent to the carrier
	#output delete other requests sent from sender to carrier
	#Author: Mohamed M. Khairy

	def accept_helper(requests)
		requests.each do|t|
		other_requests = Array.new
		request = Requests.find(:all, :conditions => {:sender_Id => t.sender_Id})
			other_requests.push request
				if(other_requests!=nil)
					other_requests.each do |other_request|
						other_request.each do |o|
							if((o.accept == nil || o.accept == false) && o.carrier_Id != t.carrier_Id)   
								o.destroy
							end
						end
					end	
				end	
			end
		end

    #This method show package
    #Input: package_id
    #Output: Package
		def  show_package
				@package = Packages.find(params[ :id ])
	  end

	#This method update the accept attributr to false in a reacord of request
	#input: request record
	#output: update accept to true
	#Author: Mohamed M. Khairy

	def reject
		request = Requests.find(params[:id])
		if (request.accept == nil)
			request.update(:accept => false)
			notification (request.carrier_Id)
			redirect_to(:action => 'index')
		end
	end

#This method notify sender if carrier accept or reject his request
#input: id of user carrier
#output:Insert notification in the database
#Author: Mohamed M. Khairy


	def notification (user_id)
		requests=Requests.find(:all, :conditions => {:carrier_Id => user_id})
		if(requests != nil)
			senders_id = Array.new
			requests.each do |t|
			  sender_id = t.sender_Id;
				senders_id.push sender_id;
			end
			senders_id.each do |s|
				notification =  Notifications.new;
				notification.user_Id = s;
        user = Users.find_by_id(user_id).username
				requests.each do |t|
        	if ((t.sender_Id == s) && (t.accept == true))
          	notification.description = user +" "+ "accepted your request";
          elsif ((t.sender_Id == s) && (t.accept == false))
						notification.description = user +" "+ "rejected your request";
          end
					notification.save;
			  end
		  end
    end
  end

end
