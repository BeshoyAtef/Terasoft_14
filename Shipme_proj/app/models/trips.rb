class Trips < ActiveRecord::Base
	belongs_to :users
	

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

end