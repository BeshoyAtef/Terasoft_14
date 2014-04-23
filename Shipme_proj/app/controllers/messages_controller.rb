class MessagesController < ApplicationController

#This method gets all messages sent to a certain user 
#Returns @messages_recieved-array[Messages]
#Input params[:id]
#Author Rehab A.ElShahawy

  def view_message
      @messages_recieved= Messages.find(:all, :conditions => {:receiver_Id => params[:id]}).group_by{ |t| t.sender_Id }
      @users = Users.find(:all)
    
  end

#This method allow users to send messages 
#Input params[:id],params[:username],params[:text]
#Author Rehab A.ElShahawy

  def new_message
      message = Messages.new
      message.sender_Id = params[:id]
      @users = Users.find(:all)
      @users.each do |u|
        if(u.username= params[:username])
          message.receiver_Id =u.user_Id 
        end
  end

      message.description=params[:text]
      message.save

  end

end
