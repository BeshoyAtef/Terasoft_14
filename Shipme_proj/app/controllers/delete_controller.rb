class DeleteController < ApplicationController
  #This method finds all the packages then delete the package selected
  #There is no attributes for this method
  #This method doesnt return nothing
  #Author: Abdelrahaman Y. Seoudy

  def  delete
  	
  	 @c = Packages.find(cookies[ :user_id ])
  	 if(@c.receivedByCarrier == true)
	
		  @n = Notifications.new
		  @n.description = @c.description + " was removed"
		  @n.users_id = @c.carriers_id
		  @n.save
	   end
  	
  	 @c.delete

  end



end
