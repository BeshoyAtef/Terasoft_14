class SendMessageController < ApplicationController
  def view_conversation
   @messages_sent= Messages.find(:all,
    :conditions => {:sender_Id => 1, :receiver_Id => 2}, 
    :select => "description",
    :order => 'dateTime' )
  
  @messages_received= Messages.find(:all,
    :conditions => {:sender_Id => 2, :receiver_Id => 1 }, 
    :select => "description",
    :order => 'dateTime' )
  @conv= (@messages_received +  @messages_sent)


  def send
  	#@sender_Id= params[:senderID]
  	#@receiver_Id= params[:receiverID]
  	@sender_Id=1
  	@receiver_Id=2
  	@description= params[:text]
  	msg = Messages.new
  		receiver_Id = @receiver_Id
  		sender_Id = @sender_Id
  		description=@description
  		Messages.save
  	#Message.create(description: @description, sender_Id: @sender_Id, receiverID: @receiver_Id)
    #Message.create( @textMessage,@receiver_Id, @sender_Id)

  end
end
end
