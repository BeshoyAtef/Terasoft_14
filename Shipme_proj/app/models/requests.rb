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


  #This method is inserting the request sent by the user in the database.
  #carrier_id , sender_id , package_id - integer.
  #Author:Manar A. Eltayeb.

  def self.send_requests ( carrier_id , sender_id , package_id )
    @requests_count = Requests.find( :all, :conditions => { :packages_id => package_id} ).count
    @already = Requests.where(carriers_id: carrier_id , packages_id: package_id ).exists?
    if(@requests_count < 3 && @already == false)
      request = Requests.new
      request.carriers_id = carrier_id
      request.senders_id= sender_id
      request.packages_id = package_id
      request.accept = nil
      request.save
    end
  end


  #This method is counting the number of requests sent on a certain package.
  #Input:packages_id - integer.
  #Return:@request_counter - integer.
  #Author:Manar A. Eltayeb.

  def self.count_requests ( packages_id )
    @requests_counter = Requests.find( :all, :conditions => { :packages_id => packages_id} ).count 
  end
end
