class TripsController < ApplicationController
 # This method is showing all my trips.
 # Author : Hagar E. Aly.

 def index
    list
    render('list')
  end

  def new
  end

  def create
  end 

  def edit
  end

  def update
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

  def delete
  end

  def destory
  end
end
