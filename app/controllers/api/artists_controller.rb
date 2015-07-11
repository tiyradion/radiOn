module Api
  class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :update, :comments, :destroy]
    respond_to :json
    before_action :station_logged_in? [:show]
    # before_action :promoter_logged_in?, only: [:create, :update, :destroy]
    # before_action :logged_in?, only: [:index, :show]

    def index
      @artists = Artist.all
      respond_with :api, @artists
    end

    def show
      respond_with :api, @artist
    end

    def comments
      respond_with :api, @artist.comments
    end

    def create
      @artist = Artist.new(artist_params)
      @artist.promoter_id = session[:user_id]
      @artist.save
      respond_with :api, @artist
    end

    def update
      @artist.update(artist_params)
      respond_with :api, @artist
    end

    def destroy
      @artist.destroy
      respond_with :api, @artist
    end

    private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :album_name, :song_name, :uploaded_file)
    end
  end
end
