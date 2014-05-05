class Requests < ActiveRecord::Base
	belongs_to :sender, :class_name => "Users"
	belongs_to :carrier, :class_name => "Users"
	belongs_to :packages

	#This method is inserting the request sent by the user in the database.
	#carrier_id , sender_id , package_id.
	#Author:Manar A. Eltayeb.


	def self.send_requests (carrier_id , sender_id , package_id)

     request = Requests.new
     request.carriers_id = carrier_id
     request.senders_id= sender_id
     request.packages_id = package_id
     request.accept = false
     request.save
    end

    #This method is counting the number of requests sent on a certain package.
    #packages_id.
    #@request_counter.
    #Author:Manar A. Eltayeb.


    def self.count_requests (packages_id)
    	@requests_counter = Requests.find( :all, :conditions => { :packages_id => packages_id} ).count 
    end
end
