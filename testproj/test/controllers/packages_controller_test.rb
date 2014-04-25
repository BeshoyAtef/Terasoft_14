require 'test_helper'

class PackagesControllerTest < ActionController::TestCase
  setup do
    @package = packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create package" do
    assert_difference('Package.count') do
      post :create, package: { carriers: @package.carriers, carryingPrice: @package.carryingPrice, description: @package.description, destination: @package.destination, expiryDate: @package.expiryDate, finalDelivery: @package.finalDelivery, origin: @package.origin, packageValue: @package.packageValue, rating: @package.rating, receivedByCarrier: @package.receivedByCarrier, receiverAddress: @package.receiverAddress, receiverEmail: @package.receiverEmail, receiverMobNumber: @package.receiverMobNumber, senders_id: @package.senders_id, type: @package.type, weight: @package.weight }
    end

    assert_redirected_to package_path(assigns(:package))
  end

  test "should show package" do
    get :show, id: @package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @package
    assert_response :success
  end

  test "should update package" do
    patch :update, id: @package, package: { carriers: @package.carriers, carryingPrice: @package.carryingPrice, description: @package.description, destination: @package.destination, expiryDate: @package.expiryDate, finalDelivery: @package.finalDelivery, origin: @package.origin, packageValue: @package.packageValue, rating: @package.rating, receivedByCarrier: @package.receivedByCarrier, receiverAddress: @package.receiverAddress, receiverEmail: @package.receiverEmail, receiverMobNumber: @package.receiverMobNumber, senders_id: @package.senders_id, type: @package.type, weight: @package.weight }
    assert_redirected_to package_path(assigns(:package))
  end

  test "should destroy package" do
    assert_difference('Package.count', -1) do
      delete :destroy, id: @package
    end

    assert_redirected_to packages_path
  end
end
