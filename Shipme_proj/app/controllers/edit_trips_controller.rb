class EditTripsController < ApplicationController
  def edit_trips_view
  end

  def index
  	@lis = Trips.find(:all)
  end

  def edit_trips
  	

	
  end

def edit
end


def update
@userId = 1
@tr = Trips.find(params[:id])



	if(@userId == @tr.user_Id)
      @t = @tr.id
  	  @tr.destroy
	  @trip = Trips.new
	  @trip.id = @t
	  @trip.destination = params[:requireddestination]
	  @trip.location = params[:requiredlocation]
	  @trip.maxWeight = params[:requiredweight]
	  @trip.travelDate = params[:requiredtraveldate]
	  @trip.user_Id = @userId
	  @trip.save
	  
	end
	redirect_to :action =>'index'     
  end




end
