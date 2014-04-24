require 'test_helper'

class EditPackagesControllerTest < ActionController::TestCase
  test "should get edit_package" do
    get :edit_package
    assert_response :success
  end

end
