class SendMessageController < ApplicationController
 
  def view_conversation
   @messages_sent= Messages.find(:all,
    :conditions => ["sender_Id = ? and receiver_Id = ? or sender_Id = ? and receiver_Id = ? ",1,2,2,1], 
    :order => 'created_at' )
  @conv= @messages_sent

end

  def construct_message

  end


  def send_now
  	@sender_Id=1
  	@receiver_Id=2
  	@description= params[:text]

    puts @description

  	@msg = Messages.new(
  		:receiver_Id => @receiver_Id,
  		:sender_Id => @sender_Id,
  		:description => @description
      )
  		@msg.save

       redirect_to(:action => 'view_conversation')


  end


end