require 'test_helper'

class BikeRacksControllerTest < ActionController::TestCase
  setup do
    @bike_rack = bike_racks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bike_racks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bike_rack" do
    assert_difference('BikeRack.count') do
      post :create, bike_rack: { address: @bike_rack.address, quantity: @bike_rack.quantity }
    end

    assert_redirected_to bike_rack_path(assigns(:bike_rack))
  end

  test "should show bike_rack" do
    get :show, id: @bike_rack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bike_rack
    assert_response :success
  end

  test "should update bike_rack" do
    patch :update, id: @bike_rack, bike_rack: { address: @bike_rack.address, quantity: @bike_rack.quantity }
    assert_redirected_to bike_rack_path(assigns(:bike_rack))
  end

  test "should destroy bike_rack" do
    assert_difference('BikeRack.count', -1) do
      delete :destroy, id: @bike_rack
    end

    assert_redirected_to bike_racks_path
  end

end
