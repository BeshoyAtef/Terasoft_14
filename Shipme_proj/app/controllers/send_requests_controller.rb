class SendRequestsController < ApplicationController
 
  #This method is inserting the requests being sent in table Requests in the db.
  #input : params[:id].
  #Author:  Manar A. Eltayeb.

  def  requests

       package = Packages.new
       package.id = params[:id]

       @requests_count = Requests.find( :all, :conditions => { :packages_id => package.id} ).count 
       
       if @requests_count < 3

        request = Requests.new
        request.carriers_id = 1
        request.senders_id= params[:id]
        request.packages_id = package.id
        request.accept = nil
        request.save

        
       end
      
  end
  
end

