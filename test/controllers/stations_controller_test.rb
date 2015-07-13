# require 'test_helper'
#
# class StationsControllerTest < ActionController::TestCase
#   setup do
#     @station = stations(:kathy)
#   end
#
#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:stations)
#   end
#
#   test "should get new" do
#     get :new
#     assert_response :success
#   end
#
#   test "should create station" do
#     assert_difference('Station.count') do
#       post :create, station: { email: @station.email, name: @station.name, password: @station.password }
#     end
#
#     assert_redirected_to station_path(assigns(:station))
#   end
#
#   test "should show station" do
#     get :show, id: @station
#     assert_response :success
#   end
#
#   test "should get edit" do
#     get :edit, id: @station
#     assert_response :success
#   end
#
#   test "should update station" do
#     patch :update, id: @station, station: { email: @station.email, name: @station.name, password: @station.password }
#     assert_redirected_to station_path(assigns(:station))
#   end
#
#   test "should destroy station" do
#     assert_difference('Station.count', -1) do
#       delete :destroy, id: @station
#     end
#
#     assert_redirected_to stations_path
#   end
# end
