require 'test_helper'

class PromotersControllerTest < ActionController::TestCase
    setup do
    @promoter = promoters(:jimmy)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promoter" do
    assert_difference('Promoter.count') do
      post :create, promoter: { company_name: @promoter.company_name, email: Faker::Internet.email, name: @promoter.name, password: "password" }
    end

    assert_redirected_to root_url
  end

  test "should get edit" do
    get :edit, id: @promoter
    assert_response :success
  end

  test "should update promoter" do
    patch :update, id: @promoter, promoter: { email: @promoter.email, name: @promoter.name, password: @promoter.password }
    assert_response :success
  end

  test "should destroy promoter" do
    assert_difference('Promoter.count', -1) do
      delete :destroy, id: @promoter
    end

    assert_redirected_to root_url
    end

  # test "should add stations" do
  #   assert_difference('@promoter.stations.count', 1) do
  #   patch :update, id: @promoter, promoter: {station_ids: [@station.id]}
  #   end
  # end
end

class Api::PromotersControllerTest < ActionController::TestCase
  setup do
    @promoter = promoters(:jimmy)
    @station = stations(:kathy)
  end

  test "should add stations" do
    patch :update, format: 'json', id: @promoter.id, station_ids: [@station.id]
    assert_response :success
  end
#
#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:promoters)
#   end
#
#   test "should show promoter" do
#     get :show, id: @promoter
#     assert_response :success
#   end
#
#   test "should destroy promoter" do
#     assert_difference('Promoter.count', -1) do
#       delete :destroy, id: @promoter
#     end
#
#     assert_redirected_to promoters_path
#   end
end
