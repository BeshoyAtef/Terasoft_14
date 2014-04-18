class MessagesController < ApplicationController
  def viewmessages

  	@messages_sent= Messages.find(:all , :conditions => {:sender_Id => params[:sid]}).group_by{ |t| t.receiver_Id }
  	@messages_recieved= Messages.find(:all, :conditions => {:receiver_Id => params[:sid]}).group_by{ |t| t.sender_Id }
  end
end
