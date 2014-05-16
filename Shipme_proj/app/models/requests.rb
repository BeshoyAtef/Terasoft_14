class Requests < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	belongs_to :packages


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
end
