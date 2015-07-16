module Api
  class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :update, :comments, :destroy, :feedbacks]
    respond_to :json
    before_action :set_user, only: [:index]
    before_action :promoter_logged_in?, only: [:create, :destroy]
    before_action :logged_in?, only: [:index, :show, :update]

    def index
      @artists = @user.artists
      respond_with :api, @artists
    end

    def show
      respond_with :api, @artist
    end

    def create
      @artist = Artist.new(artist_params)
      @artist.promoter_id = session[:user_id]
      @artist.save
      respond_with :api, @artist
    end

    def update
      if session[:user_id] == @artist.promoter_id && session[:user_type] == "promoters"
        @artist.update(artist_params)
        respond_with :api, @artist
      else
        redirect_to root_url, notice: "No access to change this Artist. Not artist promoter"
      end
    end

    def destroy
      if session[:user_id] == @artist.promoter_id && session[:user_type] == "promoters"
        @artist.destroy
        respond_with :api, @artist
      else
        redirect_to root_url, notice: "No access to delete this Artist. Not artist promoter"
      end
    end

    private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def set_user
      if session[:user_type] == "stations"
        @user = Station.find(params[:station_id])
      else
        @user = Promoter.find(params[:promoter_id])
      end
    end

    def artist_params
      params.require(:artist).permit(:name, :album_name, :song_name, :uploaded_file, :picture_upload_1, :picture_upload_2, :picture_upload_3)
    end
  end
end
