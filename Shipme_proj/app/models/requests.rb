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

	#This method is inserting the request sent by the user in the database.
	#carrier_id , sender_id , package_id - integer.
	#Author:Manar A. Eltayeb.

	def self.send_requests (carrier_id , sender_id , package_id)

     request = Requests.new
     request.carriers_id = carrier_id
     request.senders_id= sender_id
     request.packages_id = package_id
     request.accept = nil
     request.save
    end


    #This method is counting the number of requests sent on a certain package.
    #packages_id - integer.
    #@request_counter - integer.
    #Author:Manar A. Eltayeb.


    def self.count_requests (packages_id)
    	@requests_counter = Requests.find( :all, :conditions => { :packages_id => packages_id} ).count 
    end
end
