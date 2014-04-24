class SendRequestsController < ApplicationController
 
  #This method is inserting the requests being sent in table Requests in the db.
  #input : params[:id].
  #Author:  Manar A. Eltayeb.

 def  requests
       
    @requests_count = Requests.find( :all, :conditions => { :packages_id => params[:pid]} ).count 
       
    if @requests_count < 3

        request = Requests.new
        request.carriers_id = params[ :cid ]
        request.senders_id= cookies[:user_id ]
        request.packages_id = params[ :pid ]
        request.accept = false
        request.save
    end
      
  end
  

  #This method is counting the number of sent requests.
  #input:params[:pid].
  #output: number of packages.
  #Author: Manar A. Eltayeb.

  def  sendrequest
       
    @requests_count = Requests.find( :all, :conditions => { :packages_id => params[:pid]} ).count 


  end
end

