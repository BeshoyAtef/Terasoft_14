require 'test_helper'

class RevenuesControllerTest < ActionController::TestCase
  test "should get rev" do
    get :rev
    assert_response :success
  end

end
