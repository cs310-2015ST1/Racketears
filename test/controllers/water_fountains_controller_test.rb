require 'test_helper'

class WaterFountainsControllerTest < ActionController::TestCase

  setup do
    @water_fountain = water_fountains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:water_fountains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create water_fountain" do
    assert_difference('WaterFountain.count') do
      post :create, water_fountain: { lat: @water_fountain.lat, location: @water_fountain.location, lon: @water_fountain.lon }
    end

    assert_redirected_to water_fountain_path(assigns(:water_fountain))
  end

  test "should get edit" do
    get :edit, id: @water_fountain
    assert_response :success
  end

  test "should update water_fountain" do
    patch :update, id: @water_fountain, water_fountain: { lat: @water_fountain.lat, location: @water_fountain.location, lon: @water_fountain.lon }
    assert_redirected_to water_fountain_path(assigns(:water_fountain))
  end

  test "should destroy water_fountain" do
    assert_difference('WaterFountain.count', -1) do
      delete :destroy, id: @water_fountain
    end

    assert_redirected_to water_fountains_path
  end
end
