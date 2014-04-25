require 'test_helper'

class AdminHomepageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get view_shipments" do
    get :view_shipments
    assert_response :success
  end

end
