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
