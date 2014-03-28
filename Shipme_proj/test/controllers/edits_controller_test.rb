require 'test_helper'

class EditsControllerTest < ActionController::TestCase
  setup do
    @edit = edits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:edits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create edit" do
    assert_difference('Edit.count') do
      post :create, edit: {  }
    end

    assert_redirected_to edit_path(assigns(:edit))
  end

  test "should show edit" do
    get :show, id: @edit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @edit
    assert_response :success
  end

  test "should update edit" do
    patch :update, id: @edit, edit: {  }
    assert_redirected_to edit_path(assigns(:edit))
  end

  test "should destroy edit" do
    assert_difference('Edit.count', -1) do
      delete :destroy, id: @edit
    end

    assert_redirected_to edits_path
  end
end
