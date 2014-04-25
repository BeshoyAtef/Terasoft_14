class TripsController < ApplicationController
 #This method is viewing the trips 
 #input: id Integer
 #Returns :@add_trips -array[trips]
 #Author :Hagar E. Aly

  def index
    @add_trips = Trips.find(:all , :conditions => { :users_Id => cookies[ :user_id]})
  end


  def delete
  end

#This method is deleting trips
#input: id Integer
#Author :Hagar E. Aly

  def deletetrips
    @trip = Trips.find (params[:id])
     if @trip.delete
      notification (cookies[ :user_id])
   else

  end
  end
  #this method send a  message to the user once the trip is deleted
  #input : user_id Integer
  #Returns :@notifications(Notifications model)
  #Author :Hagar E. Aly

  def notification (user_id)
    requests=Requests.find(:all,:conditions => {:carriers_id => user_id})
     if(requests != nil)
     senders_id = Array.new
     requests.each do |t| 
     sender_id = t.senders_id;
     senders_id .push sender_id;
  end
  senders_id .each do |s|
  notification = Notifications.new;
  notification.users_id=s;
  user=users.find_by_id(user_id).username
  requests.each do |t|
    if (t.senders_id == s)
      notification.description=user+""+"deleted his trip please try to find another carrier";
     notification.save;
 end
 end
end
return;
end
end

end

