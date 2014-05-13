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
	
	
end
