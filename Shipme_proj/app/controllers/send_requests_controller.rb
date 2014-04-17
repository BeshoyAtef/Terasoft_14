class SendRequestsController < ApplicationController
 
  #This method is inserting the requests being sent in table request in the db.
   #Author:  Manar A. Eltayeb.

  def  requests
  
 		
  		 @requests_count = Requests.find( :all, :conditions => { :sender_id => 2 } ).count 
  		 
  		 if @requests_count < 3

  		  request = Requests.new
  		  request.carrier_Id = 1
  		  request.sender_Id = 2
  		  request.accept = false
  		  request.save
            	
  			
       end
  		
  end
  
end
