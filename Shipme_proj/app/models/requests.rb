class Requests < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	belongs_to :packages

  require 'will_paginate/array'


  # This method gets the requests that a certain user is the carrier of them.
  # user_id - int.
  # Returns - array of requests.
  # Author: Youssef A. Saleh.


	def self.requests_for_edit_notification(user_id)
	  current_user_request = Requests.find(:all, :conditions => {:carriers_id => user_id})
	  return current_user_request
	end



  #This methods should get the requests accepted or rejected by a specific carrier on a specific package
  #Inputs: cookies[:user_id]-int
  #Returns: @requests
  #Author: Youssef S.Barakat

  def  self.get_requests_accept_reject( user_id )
    @requests = Requests.find( :all, :conditions => {:carriers_id => user_id} )
  end


  #This methods should return package to view if it is deleted or not
  #Inputs: cookies[:user_id]-int
  #Returns: @requests
  #Author: Youssef S.Barakat

  def  self.get_requests_delete_package( user_id )
    @requests = Requests.find( :all, :conditions => {:senders_id => user_id} )
  end


  #This methods should return package to view if a trip is deleted or not
  #Inputs: cookies[:user_id]-int
  #Returns: @requests
  #Author: Youssef S.Barakat

  def  self.get_requests_delete_trip( user_id )
    @requests = Requests.find( :all, :conditions => {:carriers_id => user_id} )
  end
  def self.requests_for_edit_notification(user_id)
     current_user_request = Requests.find(:all, :conditions => {:carriers_id => user_id})
     return current_user_request
  end

  # This method gets the user's requests.
  # user_id - int, packages_id - int.
  # Returns - current_user_request.
  # Author: Youssef A. Saleh.

  def self.current_user_requests(user_id, packages_id)
    current_user_request = Requests.find(:all, :conditions => {:senders_id => user_id, :packages_id => packages_id})
    return current_user_request
  end


  # This method gets whether one request of the user is accepted or not
  # requests - array of requests.
  # Returns - @is_accepted.
  # Author: Youssef A. Saleh.

  def self.get_acceptance(requests)
    @is_accepted = false
    requests.each do |t|
    @is_accepted = t.accept
    @carrier_id = t.carriers_id
    if (@is_accepted == true)
      break
    end
    end
    return @is_accepted
  end

  #This method get requests paginated
  #input: no input
  #output: #@requests_Array
  #Author: Mohamed M.Khairy

  def self.get_requests_paginated(user_id,page)
    @requests = Requests.find(:all, :conditions => {:carriers_id => user_id, :accept => nil })
    @requests=@requests.paginate(:page => page, :per_page => 1)
  end


  #This method gets an array of users that sent request to a certain user
  #input: no input
  #output: #@requests_Array
  #Author: Mohamed M.Khairy

  def self.get_requests(user_id)
    @requests = Requests.find(:all, :conditions => {:carriers_id => user_id})
  end

  #This method gets an array of users that sent request to a certain use 
  #input: no input
  #output: #@requests_Array
  #Author: Mohamed M.Khairy




  def self.get_accepted_requests(user_id,page)
    @requests = Requests.find(:all, :conditions => {:carriers_id => user_id, :accept => true })
    @requests=@requests.paginate(:page => page, :per_page => 1)
  end

  #This method shows a request in the view to accept or reject it
  #input: no input
  #output: show request
  #Author: Mohamed M.Khairy

  def self.show_request(id)
    @request=Requests.find(id)
  end

  #This method update accept attribute in a request. 
  #input: no input.
  #output: show request.
  #Author: Mohamed M.Khairy.

  def self.update_request(request,flag)
    request.update(:accept => flag)
  end


  #This method update accept attribute in a request. 
  #output:updating request.
  #Author: Mohamed M.Khairy.

  def self.update_sender(request)
    request.update(:senders_id => nil)
  end


  #This method update accept attribute in a request. 
  #input: no input.
  #output: show request.
  #Author: Mohamed M.Khairy.

  def self.get_requests_senders(user_id)
    @requests = Requests.find(:all, :conditions => {:senders_id => user_id})
  end


  #This method cancels the request after accepting it.
  #input: no input.
  #output: updating accept attribute in the request false.
  #Author: Mohamed M.Khairy.

 def self.cancel_request(request_id)
   
    request = Requests.find_by_id(request_id)
    request.to_a.each do|r|
    @package=Packages.find_by_id(r.packages_id).receivedByCarrier
    if(@package!=true)
      user = Users.find_by_id(request.carriers_id).username
      @notification = Notifications.new
      @notification.users_id = request.senders_id
      @notification.description = user +" "+ "canceled your accepted request"
      @notification.save
      
     request.update(:accept => false)
    end
     
    end  
  end
end
