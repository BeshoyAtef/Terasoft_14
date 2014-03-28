require 'test_helper'

class PackageEditingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
