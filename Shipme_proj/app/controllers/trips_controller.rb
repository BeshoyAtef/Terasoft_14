class TripsController < ApplicationController
 
  def index
    @add_trips = Trips.find(:all , :conditions => { :user_Id => params[ :sid]})
  end
  def newtrip
  	@trip = Trips.new()
  	@trip.destination='america'
  	@trip.location='ghjkl'
  	@trip.maxWeight=2
  	@trip.travelDate='25/12/2014'
  	@trip.save
  end


end

