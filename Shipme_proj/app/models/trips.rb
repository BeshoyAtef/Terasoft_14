class Trips < ActiveRecord::Base
	belongs_to :users

	def self.my_trips (user_id)
		@trips = Trips.find(:all , :conditions => {:users_id => user_id})
	end

	def self.find_trip (trip_id)
		@trip = Trips.find(trip_id)
	end 

	def self.create_trip(destination,location,date,weight,user_id)
		trip=Trips.new
		trip.destination=destination
		trip.location=location
		trip.travelDate=date
		trip.maxWeight=weight
        trip.users_id=user_id
        trip.save
	end	
end
