class Trips < ActiveRecord::Base
	belongs_to :users
	require "will_paginate/array"

  	# this method is showing all my trips.
  	# Input :user_id:Integer.
	 # Author : Hagar E. Aly.

	def self.my_trips (user_id)
		@trips = Trips.find(:all , :conditions => {:users_id => user_id})
	end
  

	 # this method is showing the selected trip.
	 # Input :trip_id:Integer.
   # Author : Hagar E. Aly.

	def self.find_trip (trip_id)
		@trip = Trips.find(trip_id)
	end 
	
 
 #This method inserts Trips attributes into the database.
 #destination - string, location - string, maxWeight - float, travelDate - date, users_id - int.
 #Author: Ahmed H. Nasser.
    
  def self.create_trip (destination,location,weight,date,user_id)
    @flag=false
    @trip = Trips.new
    @trip.destination=destination
    @trip.location=location
    @trip.maxWeight=weight
    @trip.travelDate=date
    @trip.users_id=user_id 
    @trip.save
    @flag=true
    return @flag
  end


  # This method edits a trip
  # trip - trip, destination - string, location - string, maximum - int, travel - date, user - int.
  # Author: Youssef A. Saleh.

  def self.edit_the_trip(trip,destination,location,maximum,travel,user)
    trip.destination = destination
    trip.location = location
    trip.maxWeight = maximum
    trip.travelDate = travel
    trip.users_id = user
    trip.save
  end


  #This methods should get trips
  #Inputs: cookies[:user_id]-int
  #Returns: @trips
  #Author: Youssef S.Barakat

  def  self.get_all_trips( user_id )
    @trips = Trips.find( :all )
  end


  #This method separates each trip in the view in a single page.
  #Input : user_id and page -int.
  #Author : Salah K.Zalat.

  def  self.get_trips(user_id,page)
    @trips=Trips.find(:all , :conditions => {:users_id => user_id})
    @trips=@trips.paginate(:page => page, :per_page => 1)
  end

   # this method is deleting the selected trip.
   # Input :trip_id:Integer.
   # Author : Hagar E. Aly


 def self.delete_trip(trip_id)
  #@trip = Trips.find (:all )
  @trip= Trips.find(trip_id)
  @trip.destroy
 end


end