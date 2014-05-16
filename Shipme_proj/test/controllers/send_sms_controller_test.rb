require 'test_helper'

class SendSmsControllerTest < ActionController::TestCase
  test "should get send_sms" do
    get :send_sms
    assert_response :success
  end

  test "should get message" do
    get :message
    assert_response :success
  end

  test "should get test" do
    get :test
    assert_response :success
  end

end
