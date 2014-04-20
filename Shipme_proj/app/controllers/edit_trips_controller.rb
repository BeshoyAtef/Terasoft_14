class EditTripsController < ApplicationController
  def edit_trips_view
  end

  def index
    @userId = 1
    @lis = Trips.find(:all, :conditions => {:user_Id => @userId})
  end

  def edit_trips
  end

  def edit
  end
  
  def notification (user_id)
    requests=Requests.find(:all, :conditions => {:carrier_Id => user_id})
    if(requests != nil)
     senders_id = Array.new
       requests.each do |t|
       sender_id = t.sender_Id;
       senders_id.push sender_id;
       end
    senders_id.each do |s|
    notification =  Notifications.new;
    notification.user_Id = s;
    user = Users.find_by_id(user_id).username
    
      requests.each do |t|
       if (t.sender_Id == s)
        notification.description = user +" "+ "edited his trip, please check it!";
        notification.save;
       end
     end
   end

       return;          
    end
  end

  def update
    @userId = 1
    @tr = Trips.find(params[:id])
      if(@userId == @tr.user_Id)
       @t = @tr.id
       @tr.destroy
       @trip = Trips.new
       @trip.id = @t
       @trip.destination = params[:requireddestination]
       @trip.location = params[:requiredlocation]
       @trip.maxWeight = params[:requiredweight]
       @trip.travelDate = params[:requiredtraveldate]
       @trip.user_Id = @userId
       @trip.save
       notification(@userId)
      end
     redirect_to :action =>'index'     
  end
end
