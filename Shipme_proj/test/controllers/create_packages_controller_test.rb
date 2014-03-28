require 'test_helper'

class CreatePackagesControllerTest < ActionController::TestCase
  setup do
    @create_package = create_packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:create_packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create create_package" do
    assert_difference('CreatePackage.count') do
      post :create, create_package: { Expiry_Date: @create_package.Expiry_Date, description: @create_package.description, destination: @create_package.destination, origin: @create_package.origin, receiverAddress: @create_package.receiverAddress, receiverMail: @create_package.receiverMail, receivermobile: @create_package.receivermobile, value: @create_package.value, weight: @create_package.weight }
    end

    assert_redirected_to create_package_path(assigns(:create_package))
  end

  test "should show create_package" do
    get :show, id: @create_package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @create_package
    assert_response :success
  end

  test "should update create_package" do
    patch :update, id: @create_package, create_package: { Expiry_Date: @create_package.Expiry_Date, description: @create_package.description, destination: @create_package.destination, origin: @create_package.origin, receiverAddress: @create_package.receiverAddress, receiverMail: @create_package.receiverMail, receivermobile: @create_package.receivermobile, value: @create_package.value, weight: @create_package.weight }
    assert_redirected_to create_package_path(assigns(:create_package))
  end

  test "should destroy create_package" do
    assert_difference('CreatePackage.count', -1) do
      delete :destroy, id: @create_package
    end

    assert_redirected_to create_packages_path
  end
end
