require 'test_helper'

class AddTripsControllerTest < ActionController::TestCase
  setup do
    @add_trip = add_trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_trip" do
    assert_difference('AddTrip.count') do
      post :create, add_trip: { Destination: @add_trip.Destination, Location: @add_trip.Location, MaximumWeight: @add_trip.MaximumWeight, TravellingDate: @add_trip.TravellingDate }
    end

    assert_redirected_to add_trip_path(assigns(:add_trip))
  end

  test "should show add_trip" do
    get :show, id: @add_trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_trip
    assert_response :success
  end

  test "should update add_trip" do
    patch :update, id: @add_trip, add_trip: { Destination: @add_trip.Destination, Location: @add_trip.Location, MaximumWeight: @add_trip.MaximumWeight, TravellingDate: @add_trip.TravellingDate }
    assert_redirected_to add_trip_path(assigns(:add_trip))
  end

  test "should destroy add_trip" do
    assert_difference('AddTrip.count', -1) do
      delete :destroy, id: @add_trip
    end

    assert_redirected_to add_trips_path
  end
end
