module Api
    class ArtistsController < ApplicationController
      before_action :set_artist, only: [:show, :update, :destroy]
      respond_to :json
      before_action :promoter_logged_in?, only: [:create, :update, :destroy]
      before_action :logged_in?, only: [:index, :show]

      # GET /artists.json
      def index
        if session[:user_type] == "stations"
          @artists = Artist.all
          respond_with :api, @artists
        else
          @artists = @promoter.artists
          respond_with :api, @artists
        end
      end

      # GET /artists/1
      def show
        respond_with :api, @artist
      end

      # POST /artists
      def create
        @artist = Artist.new(artist_params)
        @artist.promoter_id = session[:user_id]
        @artist.save
        respond_with :api, @artist
      end

      # PATCH/PUT /artists/1
      def update
        @artist.update(artist_params)
        respond_with :api, @artist
      end

      # DELETE /artists/1
      def destroy
        @artist.destroy
        respond_with :api, @artist
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_artist
        @artist = Artist.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def artist_params
        params.require(:artist).permit(:name, :album_name, :song_name, :uploaded_file)
      end

      # def logged_in?
      #   if Station.find_by_id(session[:user_id]) && session[:user_type] == "stations"
      #     @station = Station.find_by_id(session[:user_id])
      #   elsif Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoters"
      #     @promoter = Promoter.find_by_id(session[:user_id])
      #   else
      #     redirect_to sessions_login_path, notice: "Please login"
      #   end
      # end
      #
      # def promoter_logged_in?
      #   unless Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoters"
      #     redirect_to sessions_login_path, notice: "Please login"
      #   end
      # end
    end
end
