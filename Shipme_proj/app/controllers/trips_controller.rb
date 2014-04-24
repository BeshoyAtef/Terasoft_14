class TripsController < ApplicationController
 #This method is viewing the trips 
 #input: ID Integar
 #Hagar Essam

  def index
    @add_trips = Trips.find(:all , :conditions => { :users_Id => params[ :sid]})
  end

  def newtrip
    @trip = Trips.new()
    @trip.destination='america'
    @trip.location='Cairo'
    @trip.maxWeight=2
    @trip.travelDate='25/12/2014'
    @trip.save
  end

  def delete
  end

#This method is deleting trips
#input: id Integar
#Hagar Essam

  def deletetrips
    @trip = Trips.find (params[:id])
     if @trip.delete
      notification (params[:id])
   else

  end
  end
  #this method send a  message to the user once the trip is deleted
  #Hagar Essam

  def notification (user_Id)
    requests=Requests.find(:all,:conditions => {:carrier_Id => users_id})
     If(requests != nil)
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
    if (t.senders_id==s)
      notification.description=user+""+"deleted his trip please try to find another carrier";
     notification.save;
 end
 end
end
return;
end
end





