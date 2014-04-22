class AddTripsController < ApplicationController

  def newtrip
    @trip=Trips.new()
     @trip.destination='america'
      @trip.location='alex'
      @trip.maxWeight=2.0
      @trip.travelDate='25/12/20014'
      @trip.user_Id=4
      @trip.save
  end 
end