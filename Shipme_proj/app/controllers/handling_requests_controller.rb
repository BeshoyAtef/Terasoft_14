class HandlingRequestsController < ApplicationController

  #This method get array of users that sent request to a certain user
  #input: no input
  #output: #users_Array
  #Author: Mohamed M.Khairy

  def  index
    @requests = Requests.find(:all, :conditions => {:carriers_id => cookies[ :user_id ]})
    @users = Array.new
    @requests.each do|request| 
      @user = Users.find(:all, :conditions => {:id => request.senders_id})
      @users.push @user
     end
  end


  #This method show request in the view to accept or reject it
  #input: no input
  #output: show request
  #Author: Mohamed M.Khairy

  def  show
     @request = Requests.find(params[ :id ])
  end


  #This method delete all other requests sent to other carriers from the sender
  #Input: no input
  #output:delete other requests from the sender to other carrier,notify
  #Author: Mohamed M.Khairy

  def  accept 
    request = Requests.find( params[ :id ] )
    requests = Requests.find(:all, :conditions => {:carriers_id => cookies[:user_id]} )
    package = Packages.find_by_id(request.packages_id)
    if (request.accept == nil)
      request.update(:accept => true)
      package.update(:senders_id => request.senders_id)
      package.update(:carriers_id => request.carriers_id)
      notification (request.carriers_id)
      accept_helper(requests)
      request.destroy
      redirect_to(:action => 'index')
    end
  end


  #This method is a helper method for accept to delete other requests from the sender to oter carriers
  #Input: #requests_array
  #output delete other requests sent from sender to carrier
  #Author: Mohamed M. Khairy

  def  accept_helper(requests)
    requests.each do|request|
      other_requests = Array.new
      request = Requests.find(:all, :conditions => {:senders_id => request.senders_id})
      other_requests.push request
        if(other_requests!=nil)
          other_requests.each do |other_request|
            other_request.each do |other|
	            if((other.accept == nil || other.accept == false) && other.carriers_id != request.carriers_id && other.packages_id == request.packages_id)   
	              other.destroy
	            end
	          end
        end	
      end	
    end
  end


  #This method show package
  #Input: no input
  #Output: #Package_package
  #Author: Mohamed M.Khairy

  def  show_package
    @package = Packages.find(params[ :id ])
  end


  #This method update the accept attributr to false in a reacord of request
  #input: request record
  #output: update accept to true
  #Author: Mohamed M. Khairy

  def reject
    request = Requests.find(params[ :id ])
    if (request.accept == nil)
      request.update(:accept => false)
      notification (request.carriers_id)
      redirect_to(:action => 'index')
    end
  end


  #This method notify sender if carrier accept or reject his request
  #input: id of user carrier
  #output:Insert notification in the database
  #Author: Mohamed M. Khairy

  def notification (user_id)
    requests=Requests.find(:all, :conditions => {:carriers_id => user_id})
    packages=Packages.find(:all, :conditions => {:carriers_id => user_id})
    if(requests != nil)
      @senders_id = Array.new
      requests.each do |request|
        sender_id = request.senders_id;
	@senders_id.push sender_id;
        end
     @senders_id.each do |sender|
       notification =  Notifications.new;
       notification.users_id = sender;
       user = Users.find_by_id(user_id).username
       requests.each do |request|
         packages.each do |package|	
	   if ((request.senders_id == sender) && (request.accept == true) && (request.packages_id==package.id))
   	     notification.description = user +" "+ "accepted your request";
           elsif ((request.senders_id == sender) && (request.accept == false) && (request.packages_id==package.id)) 
	     notification.description = user +" "+ "rejected your request";
           end
	   notification.save;
	end
       end
      end
    end
   return;
  end
end
