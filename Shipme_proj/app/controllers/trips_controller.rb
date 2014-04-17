class TripsController < ApplicationController
  def index
  end
  def newtrips
    @trip=Trips.new()
     @trip.destination='cairo'
      @trip.location='alex'
      @trip.maxWeight=2.0
      @trip.travelDate='28-12-2014'
      @trip.user_Id=4
      @trip.save
  end 

  end
