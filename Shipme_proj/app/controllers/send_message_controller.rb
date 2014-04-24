class SendMessageController < ApplicationController
  
 # this method opens the page to create a new message
 #Author: Madeleine Aziz Saad
  def construct_message
  end

#This method gets the conversation between the user signed in and another user 
#Input params[:receiver_Id, :ender_Id]
#Returns @conv-array[Messages]
#Author Madeleine Aziz Saad
  def view_conversation
    $receiver_Id = params.shift.last()
    $ender_Id = params.shift.last()
    @messages_sent= Messages.find(:all,:conditions => ["senders_id = ? and receivers_id = ? or senders_id = ? 
      and receivers_id = ? ",$receiver_Id,$sender_Id,$sender_Id,$receiver_Id],:order => 'created_at' )
   
    @conv= @messages_sent
  end 

#This method takes the input of the tect field and adds it in the Messages model and then redirect to the conversation page
#Input params[:text]
#Author Madeleine Aziz Saad
  def send_now

    @description= params[:text]
   
    @msg = Messages.new(:receivers_id => @receiver_Id,:senders_id => @sender_Id,
  	:description => @description)

    @msg.save
    redirect_to(:action => 'view_conversation')
  
  end
end