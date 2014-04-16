class SendRequestsController < ApplicationController
  def requests
  	#@maximum_requests = 0
  	#@packageid = 0
  	#@carrierid = 0
  	#loop do |request|
  		
  		request = Requests.new
  		request.carrier_Id = 1
  		request.sender_Id = @user
  		request.accept = false
  		request.save
  		count_requests
  		#sent
  		#@maximum_requests = @maximum_requests - 1
  		#break if @maximum_requests > 3
       
  		
  	end
  #end

def sent
  		render(:text => 'Sent successfully')
  	end
  	def redirectpage
  		redirect_to(:controller => "send_requests" , :action => "sent")
  	end
  	def count_requests
  		
  		
  		#Request.all.each do |r|
  			@requests_count= Requests.find(:all, :conditions => {:sender_id => 1}).count 
  			if @requests_count < 3
  			 redirectpage 
  		

  			end

  	end

end
