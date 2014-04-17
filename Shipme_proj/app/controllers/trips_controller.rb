class TripsController < ApplicationController
  def index
  end
  def newtrips
    @trip=Trips.new
  end 
def create
	@trip = Trips.new(params[:trip])
	@trip.save
		redirect_to(:action => 'new')
	  end
end
