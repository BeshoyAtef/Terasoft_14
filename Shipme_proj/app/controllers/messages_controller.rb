class MessagesController < ApplicationController

#This method gets all messages sent to a certain user 
#Returns @messages_recieved-array[Messages]
#Input params[:id]
#Author Rehab A.ElShahawy

  def view_message
      @messages_recieved= Messages.find(:all, :conditions => {:receivers_id => cookies[ :user_id ]}).group_by{ |t| t.senders_id }
      @users = Users.find(:all)
    
  end

#This method allow users to send messages 
#Input params[:id],params[:username],params[:text]
#Author Rehab A.ElShahawy

  def new_message
      message = Messages.new
      message.senders_id = cookies[ :user_id ]
      @users = Users.find(:all)
      @users.each do |u|
        if(u.username == params[:username])
          message.receivers_id =u.id
        end
      end

      message.description=params[:text]
      message.save

  end

end
