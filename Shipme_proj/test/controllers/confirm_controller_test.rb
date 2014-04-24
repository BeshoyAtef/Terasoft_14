require 'test_helper'

class ConfirmControllerTest < ActionController::TestCase
  test "should get confirm" do
    get :confirm
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get input" do
    get :input
    assert_response :success
  end

end
