
class MessagesController < ApplicationController
  
  def new
   Messages.send_new_message(cookies[ :user_id ],params[:username],params[:text])
  end

  def show
    @messages_received = Messages.get_last_message (cookies[ :user_id ])
    @users = Users.all_users
  end

#This method calls the get_conversation action in messages model giving it the sender id and receiver id
#Input params[:receiver_Id, :ender_Id]
#Returns @conv-array[Messages]
#Author Madeleine Aziz Saad

  def list 
    $sender_Id= params.shift.last() 
    $receiver_Id = params.shift.last() 
    @conv= Messages.get_conversation($sender_Id, $receiver_Id)
   
  end 

#This method takes the input of the text field, adds it in the Messages model and then redirect to the conversation page
#Input params[:text]
#Author Madeleine Aziz Saad
  def update 
     $description= params[:text] 
     @msg = Messages.send_message($receiver_Id,$sender_Id,$description) 
     redirect_to(:action => 'list') 
  end

 #This method opens the page to create a new message
 #Author: Madeleine Aziz Saad

  def create
  end

end
