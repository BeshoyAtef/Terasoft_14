class TripsController < ApplicationController
	def deloldtrips
		Trip.all.each do |t|
			if date.parse(t.date)< date.today
				trip.destroy
			end
		end
	end
end
