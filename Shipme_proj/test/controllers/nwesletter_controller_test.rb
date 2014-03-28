require 'test_helper'

class NwesletterControllerTest < ActionController::TestCase
  test "should get mailer" do
    get :mailer
    assert_response :success
  end

  test "should get daily" do
    get :daily
    assert_response :success
  end

end
