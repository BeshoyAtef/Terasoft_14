class EditTripsController < ApplicationController
  

  #This methods gets the user his list of trips to edit what he wants
  # current_user_id - int, current_user_trips - list of the user's package
  # Returns: list of the user's Packages
  # Author: Youssef A. Saleh

  def index
    @current_user_id = cookies[: user_id ]
    @current_user_trips = Trips.find(:all, :conditions => {:users_id => @current_user_id})
  end


  #This method displays the form and the layout
  # no parameters because it just displays the form
  # Returns the form
  # Author: Youssef A. Saleh.

  def edit
  end
  

  # This method send notification to the sender when the carrier edits his trip
  # requests - get the request of the current user, senders_id - array of the senders' ids that sent requests to/from the user(carrier), sender_id - each sender_id in the matching list in requests, notification - the notification that will be sent to the senders if any, user - gets the username of the sender that will be notified
  # Returns: sends notification to the matching senders if any
  # Author: Youssef A. Saleh

  def notification (user_id)
    requests = Requests.find(:all, :conditions => {:carriers_id => user_id})
    if(requests != nil)
      senders_id = Array.new
      requests.each do |t|
        sender_id = t.senders_id;
        senders_id.push sender_id;
      end
    senders_id.each do |s|
      notification =  Notifications.new;
      notification.users_id = s;
      user = Users.find_by_id(user_id).username
    
      requests.each do |t|
        if (t.senders_id == s)
          notification.description = user +" "+ "edited his trip, please check it!";
          notification.save;
        end
      end
    end

      return;          
    end
  end


  # This method edits the trip of the current user
  # current_user_id - the current logged in user - int, current_trip - the trip being edited - trip, trip_id - the id of the new trip - int, data_validated - boolean, destination - trips' destination - String, location - carrier's location - String, travel_date - carrier's travel date - date, max_weight - carrier's max afforded weight - int
  # Returns: edit the trip details and send notification to the sender if any
  # Author: Youssef A. Saleh

  def update
    @current_user_id = cookies[ :user_id ]
    @current_trip = Trips.find(params[ :id ])
    @destination = params[ :required_destination]
    @location = params[ :required_location ]
    @travel_date = params[ :required_traveldate]
    @max_weight = params[ :required_num_weight ]
    @data_validated = true

    if (@destination.length == 0 or !(@destination =~ /\S/) or @location.length == 0 or !(@location =~ /\S/) or @max_weight == nil or !(@max_weight =~ /\S/) or !(@travel_date =~ /\A(?:0?[1-9]|1[0-2])\/(?:0?[1-9]|[1-2]\d|3[01])\/\d{4}\Z/) or @travel_date == nil or !(@travel_date =~ /\S/) or !(is_numeric(@max_weight)))
      @data_validated = false
    end  
    
    if(@current_user_id == @current_trip.users_id && @data_validated == true)
      @trip_id = @current_trip.id
      @current_trip.id = @trip_id
      @current_trip.destination = params[ :required_destination ]
      @current_trip.location = params[ :required_location ]
      @current_trip.maxWeight = params[ :required_num_weight ]
      @current_trip.travelDate = params[ :required_traveldate ]
      @current_trip.users_id = @current_user_id
      @current_trip.save
      notification(@current_user_id)
    end
     redirect_to :action =>'index'     
  end

  # This method gets whether an object is an integer or not
  # o - the input sent to the method when called - object
  # Returns - boolean
  # Author: Youssef A. Saleh


  def is_numeric(o)
    true if Integer(o) rescue false
  end
end
