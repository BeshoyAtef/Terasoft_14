class Trips < ActiveRecord::Base
	belongs_to :users
	def self.edit_the_trip(trip,destination,location,maximum,travel,user)
        trip.destination = destination
        trip.location = location
        trip.maxWeight = maximum
        trip.travelDate = travel
        trip.users_id = user
        trip.save
 	end
end
