class TripsController < ApplicationController
  def index
    @current_user_id = cookies[:user_id]
    @current_user_trips = Trips.find(:all, :conditions => {:users_id => @current_user_id})
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @current_user_id = cookies[:user_id]
    @current_trip = Trips.find(params[ :id ])
    @destination = params[ :required_destination]
    @location = params[ :required_location ]
    @travel_date = params[ :required_traveldate]
    @max_weight = params[ :required_num_weight ]
    data_validated = true
    if (@destination.length == 0 or !(@destination =~ /\S/) or @location.length == 0 or !(@location =~ /\S/) or @max_weight == nil or !(@max_weight =~ /\S/)  or @travel_date == nil or !(@travel_date =~ /\S/))
      data_validated = false
    end
    if( data_validated == true)
    Trips.edit_the_trip(@current_trip,@destination,@location,@max_weight,@travel_date,@current_user_id)
    end
  end

  def list
  end

  def show
  end

  def delete
  end

  def destory
  end
end
