module Api
  class StationsController < ApplicationController
    before_action :set_station, only: [:show, :promoters, :update, :rankings, :artists]
    respond_to :json
    before_action :logged_in?, only: [:index, :show]
    before_action :station_logged_in?, only: [:promoters, :update]

    def index
      @stations = Station.all - @promoter.stations
      respond_with :api, @stations
    end

    def artists
      @artists = @station.artists_not_reviewed
      respond_with :api, @artists
    end

    def promoters
      respond_with :api, @station.promoters
    end

    def show
      respond_with :api, @station
    end

    def rankings
      byebug
      # params[:ranking_id].split(',').map(&:to_i).each do |id|
      #   Ranking.find(id).update(params[:artist_id], params[:rank])
      # end
    end

    def update
      @station.update(promoter_ids: params[:promoter_ids])
      respond_with :api, @station
    end

    private
      def set_station
        @station = Station.find(params[:id])
      end

      def set_station
        @promoter = Promoter.find(session[:user_id])
      end

      def station_params
        params.require(:station).permit(:name, :email, :password, :station_name,
          :phone_number, :address_1, :address_2, :city, :state, :zipcode, promoter_ids: [])
      end

      def ranking_params
        params.require(:ranking).permit(:rank, :station_id, :artist_id)
      end
  end
end
