class AddTripsController < ApplicationController
  before_action :set_add_trip, only: [:show, :edit, :update, :destroy]

  # GET /add_trips
  # GET /add_trips.json
  def index
    @add_trips = AddTrip.all
  end

  # GET /add_trips/1
  # GET /add_trips/1.json
  def show
  end

  # GET /add_trips/new
  def new
    @add_trip = AddTrip.new
  end

  # GET /add_trips/1/edit
  def edit
  end

  # POST /add_trips
  # POST /add_trips.json
  def create
    @add_trip = AddTrip.new(add_trip_params)

    respond_to do |format|
      if @add_trip.save
        format.html { redirect_to @add_trip, notice: 'Add trip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @add_trip }
      else
        format.html { render action: 'new' }
        format.json { render json: @add_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_trips/1
  # PATCH/PUT /add_trips/1.json
  def update
    respond_to do |format|
      if @add_trip.update(add_trip_params)
        format.html { redirect_to @add_trip, notice: 'Add trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @add_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_trips/1
  # DELETE /add_trips/1.json
  def destroy
    @add_trip.destroy
    respond_to do |format|
      format.html { redirect_to add_trips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_trip
      @add_trip = AddTrip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_trip_params
      params.require(:add_trip).permit(:Location, :Destination, :TravellingDate, :Weight)
    end
end
