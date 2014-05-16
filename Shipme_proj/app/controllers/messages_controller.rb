class MessagesController < ApplicationController
  def index
  end

  def new
  end


  def create
  end


  def edit
  end

#This method sends a message.
#user1_id - int, user2_id - int.
#Author Madeleine A. Saad.

  def update 
     $description= params[:text] 
     @msg = Messages.send_message($receiver_Id,$sender_Id,$description) 
     redirect_to(:action => 'list') 
  end

#This method lists the conversation.
#user1_id - int, user2_id - int.
#Returns @conv - array.
#Author Madeleine A. Saad.

  def list 
    $sender_Id= params.shift.last() 
    $receiver_Id = params.shift.last() 
    @conv= Messages.get_conversation($sender_Id, $receiver_Id)
   
  end 

  def show
  end

  def delete
  end

  def destory
  end
end

