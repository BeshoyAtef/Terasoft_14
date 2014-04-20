class HandlingRequestsController < ApplicationController

	# => This method get array of users that sent request to a certain user
	#input: requests
	#output: users sent request

  	def index

  			#@user_id = current_user.user_Id 

			@requests = Requests.find(:all, :conditions => {:carrier_Id => 3})

			@users = Array.new

			@requests.each do|t| 

					@user = Users.find(:all, :conditions => {:id => t.sender_Id})

					@users.push @user 

			
			end 
            
   
  	end

  	#This method show request in the view to accept or reject it
  	#input: request
  	#output: no output



  	def show

  		@request = Requests.find(params[:id])

	end


#This method update the accept attributr to false in a reacord of request
#Input: request record
#output: update accept to true
#Author: Mohamed M.Khairy


	def accept

			request = Requests.find(params[:id])

			if (request.accept == nil)

					request.update(:accept => true)

					notification (request.carrier_Id)

                    redirect_to(:action => 'index')

					
			elsif (request.accept == true ) 

					flash.now[:notice] = "You have already accepted this request"
					redirect_to request

					
			else

					flash[:notice] = "You have already rejected this request"

					redirect_to request	
         
    		end


	end

#This method update the accept attributr to false in a reacord of request
#Input: request record
#output: update accept to true
#Author: Mohamed M.Khairy



	def reject

			request = Requests.find(params[:id])

			if (request.accept == nil)

					request.update(:accept => true)

					notification (request.carrier_Id)

					redirect_to(:action => 'index')

			elsif (request.accept == true ) 

					flash[:notice] = "You have already accepted this request"

					redirect_to request
			else

					flash[:notice] = "You have already rejected this request"

					redirect_to request	
         
    		end


	end





	def notification (user_id)

			requests=Requests.find(:all, :conditions => {:carrier_Id => user_id})

    		if(requests != nil)

        		senders_id = Array.new

        		requests.each do |t|

        		sender_id = t.sender_Id;

        		senders_id.push sender_id;

        	 	end

                
				senders_id.each do |s|

        			notification =  Notifications.new;

        			notification.user_Id = s;
        
          
     				user = Users.find_by_id(user_id).username

            		requests.each do |t|
          
              				if ((t.sender_Id == s) && (t.accept == true))

              						notification.description = user +" "+ "accepted your request";
              
              
              				elsif ((t.sender_Id == s) && (t.accept == false))

              							notification.description = user +" "+ "accepted your request";
              
              				end

             					notification.save;

          			  end

            end 

               return;  


        
        end
       

        
    end


end