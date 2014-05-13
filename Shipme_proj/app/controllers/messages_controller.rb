
class MessagesController < ApplicationController
  
  def new
   Messages.send_new_message(cookies[ :user_id ],params[:username],params[:text])
  end

  def show
    @messages_received = Messages.get_last_message (cookies[ :user_id ])
    @users = Users.all_users
  end

  def list 
    $sender_Id= params.shift.last() 
    $receiver_Id = params.shift.last() 
    @conv= Messages.get_conversation($sender_Id, $receiver_Id)
   
  end 

  def update 
     $description= params[:text] 
     @msg = Messages.send_message($receiver_Id,$sender_Id,$description) 
     redirect_to(:action => 'list') 
  end

  def create
  end

end
