class TripsController < ApplicationController
 
 # This method is showing all my trips.
 # Author : Hagar E. Aly.

 def index
    list
    render('list')
  end

 
 #This method intialize a new trip.
 #Author: Ahmed H. Nasser.
  
  def new
    @trip = Trips.new
  end

 
 #This method creates the trip created in the new method.
 #destination - string, location - string, maxWeight - float, travelDate - date.
 #This method if the trip is saved a notice appear that the trip is created and redirect to the list view else stay on the same page.
 #Author: Ahmed H. Nasser.
  
  def create
    @flag=Trips.create_trip(params[:requireddestination],
      params[:requiredlocation],params[:requiredweight],params[:requiredtraveldate],cookies[:user_id])
    if @flag==true
      flash[:notice] = "Trip Created"
      redirect_to(:action => 'list')
    else
      render('new')
    end
   end 

  def edit
  end


  # This method edits the trip of the current user.
  # current_user_id - int, current_trip - trip, trip_id -  int, trip -  trip, data_validated - boolean, destination  - String, location - String, travel_date - date, max_weight - int.
  # Returns: edit the trip details and send notification to the sender if any.
  # Author: Youssef A. Saleh.

  def update
    current_user_id = cookies[:user_id]
    @current_trip = Trips.find(params[ :id ])
    @destination = params[ :required_destination]
    @location = params[ :required_location ]
    @travel_date = params[ :required_traveldate]
    @max_weight = params[ :required_num_weight ]
    data_validated = true
    if (@destination.length == 0 or !(@destination =~ /\S/) or @location.length == 0 or !(@location =~ /\S/) or @max_weight == nil or !(@max_weight =~ /\S/)  or @travel_date == nil or !(@travel_date =~ /\S/) or !(is_numeric(@max_weight)))
      data_validated = false
    end
    if (@destination.length == 0 or !(@destination =~ /\S/) or @location.length == 0 or !(@location =~ /\S/) or @max_weight == nil or !(@max_weight =~ /\S/)  or @travel_date == nil or !(@travel_date =~ /\S/))
      flash[:notice] = "one or more inputs are not entered, please enter everything correctly and try again"  
      redirect_to(:action => 'edit', :id => @current_trip.id)
    elsif (!(is_numeric(@max_weight)))
      flash[:notice] = "weight should be an integer"
      redirect_to(:action => 'edit', :id => @current_trip.id)
    else
      Trips.edit_the_trip(@current_trip,@destination,@location,@max_weight,@travel_date,current_user_id)
      notification (current_user_id)
      flash[:notice] = "your trip was successfully edited"  
      redirect_to(:action => 'index')
    end
  end
  

  # this method is showing all my trips.
  # Input :id:Integer.
  # Author : Hagar E. Aly.
  
  def list
   @trips = Trips.my_trips(cookies[ :user_id ] )
  end
  

  # this method is showing the selected trip.
  # Input :id:Integer.
  # Author : Hagar E. Aly.

  def show
   @trip = Trips.find_trip(params[ :id ] )
  end

  
  # this method is deleting the selected trip.
  # Input :id:Integer.
  # Author : Hagar E. Aly.

  def delete
     @trip = Trips.find_trip( params[ :id ])
  end

  # this method is deleting the selected trip.
  # Input :id:Integer.
  # Author : Hagar E. Aly.

  def destory
    @trip =  Trips.delete_trip( params[ :id ] )
    flash[:notice] = "Trip Deleted successfuly"
    redirect_to(:action => 'list')
  end


  # This method send notification to the sender when the carrier edits his trip.
  # requests - request, senders_id - array of integers, sender_id - array of integers, notification - notification, user - String.
  # Returns: sends notification to the matching senders if any.
  # Author: Youssef A. Saleh.

  def notification (user_id)
    requests = Requests.requests_for_edit_notification(user_id)
    if(requests != nil)
      senders_id = Array.new
      requests.each do |t|
        sender_id = t.senders_id
        senders_id.push sender_id
      end
      senders_id.each do |s|
        notification = Notifications.set_notification(s)
        user = Users.find_by_id(user_id).username
        requests.each do |t|
          if (t.senders_id == s)
            description = user + " " + "edited his/her trip, please check it!"
            Notifications.create_notification_trip(notification, description)
          end
        end
      end
      return
    end
  end


  # This method gets whether an object is an integer or not.
  # o - object.
  # Returns - boolean.
  # Author: Youssef A. Saleh.

  def is_numeric(o)
    true if Integer(o) rescue false 
  end
end