require 'test_helper'

class EditTripsControllerTest < ActionController::TestCase
  test "should get edit_trips_view" do
    get :edit_trips_view
    assert_response :success
  end

end
