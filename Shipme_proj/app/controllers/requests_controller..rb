class RequestsController < ApplicationController
	#This method (index) define requests matched with the logged in user's id to viewed them in the index.html
	#input: userlogged in id
	#Output: requests of this carrier logged in with userlogged in id
    #Author: Mohamed M. Khairy
  def index
  			@user_id = current_user.user_Id 

			@requests = Requests.find(:all, :conditions => {:carrier_Id => current_user_Id})

			@requests.each do|t|  #loop to match each sender_id in the requests to match with the user_Id to get the sender's usernames
			@users = Users.find(:all, :conditions => {:user_Id => t.sender_Id}) #compare each sender_Id with the user_Id in table users to get usernames of users 
			
			end 
            
   end

end
