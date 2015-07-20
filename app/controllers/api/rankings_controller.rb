module Api
  class RankingsController < ApplicationController
    respond_to :json
    before_action :set_station, only: [:index]
    before_action :set_ranking, only: [:show, :destroy]

    def index
      @rankings = @station.rankings
      respond_with :api, @rankings
    end

    def show
      respond_with :api, @ranking
    end

    def create
      @ranking = Ranking.new(ranking_params)
      @ranking.station_id = session[:user_id]
      @ranking.save
      respond_with :api, @ranking
    end

    def batch_update
      Ranking.batch_update(request.raw_post)
    end

    def update
      if session[:user_id] == @ranking.station_id && session[:user_type] == "stations"
        @ranking.update(ranking_params)
        respond_with :api, @ranking
      else
        redirect_to root_url, notice: "No access to change this ranking."
      end
    end

    def destroy
      if session[:user_id] == @ranking.station_id && session[:user_type] == "stations"
        @ranking.destroy
        respond_with :api, @ranking
      else
        redirect_to root_url, notice: "No access to delete this ranking."
      end
    end

    private
      def set_ranking
        @ranking = Ranking.find(params[:id])
      end

      def set_station
        @station = Station.find(params[:station_id])
      end

      def ranking_params
        params.require(:ranking).permit(:rank, :station_id, :artist_id)
      end
  end
end
