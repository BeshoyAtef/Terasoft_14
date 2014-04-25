class RemovePackageController < ApplicationController
  
#This method get user_id and package_id and delete a certain package.
#Author: Salah K. Zalat.


  def deletepackage
  	  @package=Packages.find(:all, :conditions => {:id => params[:id], :senders_id => cookies[ :user_id ]})
      @package.each do |p|
      @req=Requests.find(:all, :condition => { :senders_id=> cookies[ :user_id ]}, :condition => { :packages_id=> p.id})

    if (@package!=nil && @package.receivedByCarrier!=true)
      @package.destroy
    elsif (@package!=nil && @package.receivedByCarrier==true)
      notification(cookies[ :user_id ])
      @package.destroy

    end  	
    end
   return;
  end 

  def notification (user_id)
   requests=Requests.find(:all, :conditions => {:senders_id => cookies[ :user_id ]}) 
   packages=Packages.find(:all, :conditions => {:senders_id => cookies[ :user_id ]}) 
   if(requests != nil) 
     packages.each do |t|
     	requests.each do |s|
     		if ((t.id == s.packages_id) && (t.senders_id == s.senders_id) && (t.carriers_id == s. carriers_id) && (s.accept == true))
		      notification = Notifications.new; 
   		      notification.users_id = t.carriers_id; 
   		      notification.description = "A package has been deleted"
   		      notification.save;
   		    end 
   	    end 
      end 
    end
   return; 
end

   def show
  	 @package=Packages.find(params[:id])
   end

end
