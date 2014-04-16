class SendMessagesController < ApplicationController
  def conversation
  	@myMessages= Messages.find_by id: 1
 
  end

end
