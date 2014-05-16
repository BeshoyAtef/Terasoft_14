class MessagesController < ApplicationController
require 'will_paginate/array'

  def index
  end

  def new 
  end 


  #This method calls the send_new_message and pass to it three paramters.
  #Return: print-boolean which saves the output from send_new_message method.
  #Author: Rehab A.Elshahawy.

  def create
      $print=Messages.send_new_message(cookies[ :user_id ],params[ :username ],params[ :text ])
      if $print==false
        flash[ :notice ]="sorry you can't send messages to this user"
        redirect_to( :action => "new" )
      elsif $print==true
        flash[ :notice ]="Message sent successfully"
        redirect_to( :action => "new" )
      end
  end
  
  
  #This method shows the message view.
  #Author: Madeleine A. Saad.

  def edit
  end


  #This method sends a message.
  #user1_id - int, user2_id - int.
  #Author Madeleine A. Saad.

  def update 
     $description= params[ :text ] 
     @msg = Messages.send_message($receiver_Id,$sender_Id,$description) 
     redirect_to(:action => 'list') 
  end
  

  #This method lists the conversation.
  #user1_id - int, user2_id - int.
  #Returns conv - array.
  #Author Madeleine A. Saad.

  def list 
    $sender_Id= params.shift.last() 
    $receiver_Id = params.shift.last() 
    @conv= Messages.get_conversation($sender_Id, $receiver_Id)
   
  end 


  #This method calls the get_last_message passing to it the logged in user_id,
  #it also calls the method all_users to get an array of all users
  #Return: @messages_received -array of messages, @users-array of users.
  #Author: Rehab A.Elshahawy.

  def show
      @messages_received=Messages.get_last_message(cookies[ :user_id ])
      @users = Users.find_users 
  end

  def delete
  end


  def destory
  end
end
