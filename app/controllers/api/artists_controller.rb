module Api
    class ArtistsController < ApplicationController
      before_action :set_artist, only: [:show, :update, :destroy]
      respond_to :json

      # GET /artists.json
      def index
        @artists = Artist.all
        respond_with @artists
      end

      # GET /artists/1
      def shows
        respond_with @artist
      end

      # POST /artists
      def create
        @artist = Artist.create(artist_params)
        respond_with do |format|
          format.json
        end
      end

      # PATCH/PUT /artists/1
      def update
        @artist.update(artist_params)
          # respond_with @artist
      end

      # DELETE /artists/1
      def destroy
        @artist.destroy
        # respond_to do |format|
        #   format.json { head :no_content }
        # end
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
    end
end
