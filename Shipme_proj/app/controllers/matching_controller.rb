class MatchingController < ApplicationController
def read
 	@location = params[:location]

 	@destination = params[:destination]

 	
 	
    @trips = AddTrip.match(@destination,@location)
  end
end
