require 'test_helper'

class Api::ArtistsControllerTest < ActionController::TestCase
  setup do
    @artist = artists(:michael_jackson)
    @promoter = promoters(:jimmy)
    session[:user_id] = @promoter.id
    session[:user_type] = "promoters"
    session[:user_name] = @promoter.name
  end

  test "should get index" do
    get :index, format: "json"
    assert_response :success
    assert_not_nil assigns(:artists)
  end

  test "should create artist" do
    assert_difference('Artist.count') do
      post :create, format: "json", artist: {name: @artist.name, album_name: @artist.album_name, song_name: @artist.song_name, promoter_id: session[:user_id] }
    end
    assert_response :created
  end

  test "should show artist" do
    get :show, format: "json", id: @artist
    assert_response :success
  end

  test "should update artist" do
    patch :update, format: "json", id: @artist, artist: { name: @artist.name, album_name: @artist.album_name, song_name: @artist.song_name, promoter_id: session[:user_id] }
    assert_response :success
  end

  test "should destroy artist" do
    assert_difference('Artist.count', -1) do
      delete :destroy, format: "json", id: @artist
    end
    assert_response :no_content
  end



  test "should add request" do
    setup do
      @station = stations(:david)
      session[:user_id] = @station.id
      session[:user_type] = "stations"
      session[:user_name] = @station.name
    end
    assert_difference('Request.count', 1) do
      patch :update, format: 'json', id: @artist, artist:{}, params:{request: true}
    end
  end
end
